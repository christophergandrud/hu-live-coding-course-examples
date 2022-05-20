# Monte Carlo Simulation Exercises (Example Answers)
# For HU Dynamics

xfun::pkg_attach2("mcreplicate", "tidyverse")
theme_set(theme_linedraw())

# False rejection --------------------------------------------------------------

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
pv <- mc_replicate(2e3, one_sim_p_value())
hist(pv)

#' Power analysis via simulation
#' 
#' @param N vector of integers. Observations per treatment arm

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
N <- c(500, 1e3, 1e4, 1e5) / 2 # halved because one_sim_p_value takes n per arm
sims_reject <- sim_per_sample_size(N)

# Plot
false_rejects <- tibble(samp_size = (N * 2), false_rejects = sims_reject)

ggplot(false_rejects, aes(samp_size, false_rejects)) +
  geom_line() +
  ylab("Proporation Falsely Rejected\n") + xlab("\nTotal Sample Size")

# Confounding ------------------------------------------------------------------
# Simulation from <http://arelbundock.com/posts/robustness_values/>

#' One simulation
#' 
#' @param x_z relationship between X and the confounder
#' 

one_sim_confounding <- function(x_z = 0.6){
  N = 10000
  Z = rbinom(N, 1, prob = 0.5)
  X = rbinom(N, 1, prob = 0.8 - (x_z * Z))
  Y = 1 * X + 3 * Z + rnorm(N)

  fully_observed <- lm(Y ~ X + Z)$coefficients["X"]
  unobserved <- lm(Y ~ X)$coefficients["X"]

  # Unobserved confounding bias
  as.numeric(unobserved - fully_observed)
}

#' Simulate different levels of confounding
#' 
#' @param X_Z vector of numeric values of the relationship between X and Z

sims_per_confounding <- function(X_Z) {
  bias_sims <- vector(mode = "list", length = length(X_Z)) # empty vector to hold results
  u <- 1 # counter to index output to vector

  for (i in X_Z) {
    bias_sims[[u]] <- mc_replicate(1e2, one_sim_confounding(x_z = i))
    u <- 1 + u 
  }

  names(bias_sims) <- X_Z
  bias_sims <- data.frame(bias_sims) %>%
                  pivot_longer(cols = starts_with("X"))
  bias_sims$name <- gsub("X", "", bias_sims$name)
  return(bias_sims)
}

# Run simulations
X_Z <- seq(0.1, 0.8, by = 0.1)
bias_all_sims <- sims_per_confounding(X_Z = X_Z)

# Plot
ggplot(bias_all_sims, aes(name, value)) +
  geom_point(alpha = 0.2) +
  xlab("\nStrength of Confounding") +
  ylab("Counfounding Bias\n")
