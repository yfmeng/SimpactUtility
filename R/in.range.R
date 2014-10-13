
in.range<-function(x,a,b,...){
  if(!exists('left.include')){left.include=F}
  if(!exists('right.include')){right.include=F}
  test<-x>a&x<b
  if(left.include){x<-x|x==a}
  if(right.include){x<-x|x==b}
  test
}