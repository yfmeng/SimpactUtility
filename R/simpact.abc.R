# To be implemented
simpact.abc<-function(cfg,ABC.pars,target){

  ABC_Lenormand <- ABC_sequential(method="Lenormand",
                                  model=simpact4ABC,
                                  prior=simpact_prior,
                                  nb_simul=n_init,
                                  summary_stat_target=sum_stat_obs,
                                  alpha=alpha,
                                  p_acc_min=pacc,
                                  verbose=FALSE)
  
}