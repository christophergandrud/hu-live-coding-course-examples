# Monte Carlo Simulation Exercises
# For HU Dynamics

xfun::pkg_attach2("mcreplicate", "tidyverse")
theme_set(theme_linedraw())

#' Simulate A/B test and find p-vale from t-test
#'
#' @param n integer number of observations per treatment arm
#' @param control_prob numeric probability of success in the control group
#' @param rel_effect numeric relative effect of the treatment compared
#' to the control

one_sim_p_value <- function(n = 1e3, control_prob = 0.1, rel_effect = 0.01) {
  treat_prob <- control_prob + (control_prob * rel_effect)
  cy <- rbinom(n = n, size = 1, prob = control_prob)
  ty <- rbinom(n = n, size = 1, prob = treat_prob)

  t.test(cy, ty)$p.value
}

# Repeatedly simulate
pv <- mc_replicate(1e2, one_sim_p_value())
hist(pv)

#' Power analysis via simulation
#' 
#' @param N vector of integers. Observations per treatment arm
#' @param ... arguments to pass to functions

sim_per_sample_size <- function(N) {
  prop_reject <- rep(NA, length(N)) # empty vector to hold results
  u <- 1 # counter to index output to vector

  for (i in N) {
    pv_tmp <- mc_replicate(1e2, one_sim_p_value(n = i))
    false_reject <- pv_tmp > 0.05
    prop_reject[u] <- sum(false_reject) / i
    u <- 1 + u 
  }
  return(prop_reject)
}

# Simulate based on different test sample sizes
N <- c(500, 1e3, 1e4, 1e5) / 2

sims_reject <- sim_per_sample_size(N)

# Plot
false_rejects <- tibble(samp_size = (N * 2), false_rejects = sims_reject)

ggplot(false_rejects, aes(samp_size, false_rejects)) +
  geom_line() +
  ylab("Proporation Falsely Rejected\n") + xlab("\nTotal Sample Size")
