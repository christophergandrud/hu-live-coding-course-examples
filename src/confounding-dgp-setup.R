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
