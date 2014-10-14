peak<-function(x,match=F,...){
  if(missing(match)){match=F}
  x<-as.numeric(x)
  if(sum(is.na(x))>0){print('Element with invalid data format')}
  m<-which(x==max(x))
  if(!match){m<-m[1]}
}