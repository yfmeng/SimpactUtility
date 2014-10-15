# To be implemented
simpact.abc.model<-function(inputvector){
    cfg<-list.configure()
    options(warn=-1)
    numeric.cfg<-which(!is.na(as.numeric(as.character(cfg[[1]]))))
    names.cfg<-names(cfg)
    options(warn=0)
    k<-1
    for (i in numeric.cfg){
      cfg[[i]]<-inputvector[k]
      k<-k+1
    }
    results <- simpact.run(cfg, getwd())
    outputvector <- simpact.abc.target(results)
    file.remove(results)
    outputvector 
}