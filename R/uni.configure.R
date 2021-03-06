uni.configure<-function(raw.cfg){
  # if input arg is missing
  if(missing(raw.cfg)){
    # input from keyboard
    options(warn=-1)
    cfg<-list()
    cat('Parameter name:')
    in.name<-readline()
    while(in.name!=""){
      cat('Value:')
      in.value<-readline()
      if(substr(in.name,nchar(in.name)-8,nchar(in.name))=='dist.type'){
        cfg[in.name]<-in.value
      }else{
        cfg[in.name]<-as.numeric(in.value)
      }
      cat('Parameter name or enter to exit:')
      in.name<-readline()
    }
    while(sum(is.na(cfg))>0){
      for(i in which(is.na(cfg))){
        cat('Re-input invalid parameter value>>',sep="\n")
        cat(sprintf('Parameter name: %s',names(cfg)[i]),sep="\n")
        cat('Value: ',sep="\n")
        in.value<-readline()
        cfg[names(cfg)[i]]<-as.numeric(in.value)
      }
    }
    
  }else{
  # if not missing
    # input from files (.csv)  
    if(is.character(raw.cfg)){
    # read .csv files
    type<-substr(raw.cfg,nchar(raw.cfg)-2,nchar(raw.cfg))
    if(type=='csv'){
      raw.cfg<-read.csv(raw.cfg)
    }
  }
    # convert other types of input parameters into cfg list
    if(is.data.frame(raw.cfg)){
    # data frame to list
    cfg<-split(raw.cfg[,2:ncol(df)],raw.cfg[,1])
  }
    # use list directly
    if(is.list(raw.cfg)){
    # use list directly
    cfg<-raw.cfg
  }
  }
  cfg
}