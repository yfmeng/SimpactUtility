simpact2network<-function(logfile,...){
  # take the prefix of log file names 
  # convert the output to network
  require(network)
  plog<-sprintf('%spersonlog.csv',logfile)
  rlog<-sprintf('%srelationlog.csv',logfile)
  persons<-read.csv(plog)
  relations<-read.csv(rlog)
  persons<-persons[order(persons$ID),]
  Nv<-nrow(persons)
  Ne<-nrow(relations)
  net<-network.initialize(Nv,directed=F)
  if(Ne!=0){
    net<-net+add.edges(net,relations$IDm,relations$IDw)
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