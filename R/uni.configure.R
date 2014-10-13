uni.configure<-function(raw.cfg){
  # convert other types of input parameters into cfg list
  if(is.data.frame(raw.cfg)){cfg<-as.list(raw.cfg)}
  if(is.list(raw.cfg)){cfg<-raw.cfg}
  if(missing(raw.cfg)){
    # input from keyboard
  }
}