n_sims <- 1e2
n_obs <- 2e6
control_prob <- 0.1
rel_effect <- 0.01
treatment_prob <- control_prob + (control_prob * rel_effect)

one_sim_bug <- function(n, control_prob, rel_effect) {
  treat_prob <- control_prob / (control_prob * rel_effect)
  
  cy <- rbinom(n = n, size = 1, prob = control_prob)
  ty <- rbinom(n = n, size = 1, prob = treat_prob)
  
  mean(ty) - mean(cy)
}

mean_diff_bug <- rep(NA, n_sims)


for (i in 1:n_sims) {
  mean_diff_bug[u] <- one_sim_bug(n = n_obs, 
                                  control_prob = control_prob, 
                                  rel_effect = rel_effect)
}
