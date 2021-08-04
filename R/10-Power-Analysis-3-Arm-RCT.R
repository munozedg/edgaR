# 10-Power-Analysis-3-Arm-RCT

library(ThreeArmedTrials)

RATE_CONTROL      = 0.30 # Standard care
RATE_REFERENCE    = 0.36 # Patient Navigation
RATE_EXPERIMENTAL = 0.50 # PN + App
SIGNIFICANCE      = 0.025
POWER             = 0.80

# TODO: estimate DELTA
DELTA = 0.8


W_OPTIMAL <- ThreeArmedTrials::opt_alloc_RET(experiment = RATE_EXPERIMENTAL, 
                                     reference  = RATE_REFERENCE, 
                                     placebo    = RATE_CONTROL, 
                                     Delta      = DELTA, 
                                     distribution = "binary", 
                                     h = function(x){-log(x/(1-x))})
print(W_OPTIMAL)


ThreeArmedTrials::power_RET(experiment = RATE_EXPERIMENTAL, 
                            reference  = RATE_REFERENCE, 
                            placebo    = RATE_CONTROL, 
                            Delta      = DELTA,
                            sig_level  = SIGNIFICANCE,
                            power      = POWER,
                            allocation = W_OPTIMAL,
                            distribution = "binary",
                            h = function(x){-log(x/(1-x))},
                            h_inv = function(x){exp(-x)/(1+exp(-x))},
                            var_estimation = "RML")


W_EQUAL = c(1,1,1)
W_EQUAL = W_EQUAL/sum(W_EQUAL)
print(W_EQUAL)

ThreeArmedTrials::power_RET(experiment = RATE_EXPERIMENTAL, 
                            reference  = RATE_REFERENCE, 
                            placebo    = RATE_CONTROL, 
                            Delta      = DELTA,
                            sig_level  = SIGNIFICANCE,
                            power      = POWER,
                            allocation = W_EQUAL,
                            distribution = "binary",
                            h = function(x){-log(x/(1-x))},
                            h_inv = function(x){exp(-x)/(1+exp(-x))},
                            var_estimation = "RML")


W_MANUAL = c(50,40,20)
W_MANUAL = W_MANUAL/sum(W_MANUAL)
print(W_MANUAL)

ThreeArmedTrials::power_RET(experiment = RATE_EXPERIMENTAL, 
                            reference  = RATE_REFERENCE, 
                            placebo    = RATE_CONTROL, 
                            Delta      = DELTA,
                            sig_level  = SIGNIFICANCE,
                            power      = POWER,
                            allocation = W_MANUAL,
                            distribution = "binary",
                            h = function(x){-log(x/(1-x))},
                            h_inv = function(x){exp(-x)/(1+exp(-x))},
                            var_estimation = "RML")

