prior.configure<-function(pcfg,...){
  ## initiation
  cfg<-list.configure()
  if(exists('fixed')){
    for (i in 1:length(fixed)){
      cfg[[names(fixed)[i]]]<-fixed[[i]]
    }
  }
  prior<-list()
  k<-1
  for (i in 1:length(cfg)){
    if(is.numeric(cfg[[i]])){
      prior[[k]]<-c('unif',cfg[[i]],cfg[[i]])
      names(prior)[k]<-names(cfg[i])
      k<-k+1
    }
  }
  ## read priors if no input argument
  if(missing(pcfg)){
    pcfg<-list()
    # handle keyboard input 
    cat('Parameter name:')
    in.name<-readline()
    while(in.name!=""){
      this<-c()
      k<-1
      cat('Distribution(unif/normal/lognormal/exponential):')
      this[k]<-readline()
      cat(sprintf('Distribution parameter %d:',k))
      p<-readline()
      while(p!=""){
        k<-k+1
        this[k]<-p
        cat(sprintf('Distribution parameter %d or enter to next parameter:',k))
        p<-readline()
      }
      cat('Parameter name or enter to exit:')
      in.name<-readline()
      pcfg[[in.name]]<-this
    }
    
  }
  ## change the priors
  for (i in 1:length(pcfg)){
    prior[[names(pcfg)[i]]]<-pcfg[[i]]
  }
  prior
}