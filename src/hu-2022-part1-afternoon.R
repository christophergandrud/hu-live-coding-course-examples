# Pretty ugly, but works!

# ggplot2 version
xfun::pkg_attach2("tidyverse")
theme_set(theme_linedraw())

# Plot distributions
plot_hist <- function(x, xlab){
  df <- as_tibble(x)
  ggplot(df, aes(x = value)) +
    geom_histogram() +
    xlab(xlab) +
    ggtitle("a title", subtitle = "subtitle here")
}


# Simulate a test with 2,000,000 draws
n_obs <- 2e6
control_prob <- 0.1
rel_effect <- 0.01
treatment_prob <- control_prob + (control_prob * rel_effect)

control_y <- rbinom(n = n_obs, size = 1, prob = control_prob) 
plot_hist(control_y, "control")

# Simulate treatment group with one percent improvement
treatment_y <- rbinom(n = n_obs, size = 1, prob = treatment_prob) 
plot_hist(treatment_y, "Treatment")

# Difference in means
mean(treatment_y) - mean(control_y)

one_sim <- function(n_obs = 2e6, control_prob = 0.1, rel_effect = 0.01) {
  treatment_prob <- control_prob + (control_prob * rel_effect)
  
  control_y <- rbinom(n = n_obs, size = 1, prob = control_prob) 
  treatment_y <- rbinom(n = n_obs, size = 1, prob = treatment_prob)
  
  mean(treatment_y) - mean(control_y)
}

xfun::pkg_attach2("progress")

n_sims <- 1e3
mean_differences <- rep(NA, n_sims)
pb <- progress_bar$new(total = n_sims)

for (i in 1:n_sims) {
    pb$tick()
    mean_differences[i] <- one_sim()
}

plot_hist(mean_differences, "mean differences")
