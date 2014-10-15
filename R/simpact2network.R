require(network)
simpact2network<-function(log,dir,...){
  if(missing(dir)){dir<-getwd()}
  if(length(log)==1){
    # log is ID
    persons<-read.csv(sprintf('%s/%spersonlog.csv',dir,log))
    relations<-read.csv(sprintf('%s/%srelationlog.csv',dir,log))
    cfgtxt<-readLines(sprintf('%s/%config.txt',dir,log))
  }else{
    # log is the output from simpact.run
    persons<-read.csv(as.list(log)[['logpersons']])
    relations<-read.csv(as.list(log)[['logrelations']])
    cfgtxt<-readLines(as.list(log)[['configfile']])
  }  
  persons<-persons[order(persons$ID),]
  Nv<-nrow(persons)
  Ne<-nrow(relations)
  net<-network.initialize(Nv,directed=F)
  if(Ne!=0){
    net<-add.edges(net,relations$IDm,relations$IDw)
    for(col in 3:ncol(relations)){
      rname<-names(relations)[col]
      set.edge.attribute(net,rname,relations[,col]) 
    }
  }  
  for(col in 2:ncol(persons)){
    pname<-names(persons)[col]
    set.vertex.attribute(net,pname,persons[,col]) 
  }
  net
}