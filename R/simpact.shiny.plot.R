
simpact.shiny.plot<-function(type,folder){
  require(shiny)
  if(missing(folder)){folder<-getwd()}
  app.name<-sprintf('%s/plot.%s',folder,type)
  runApp(app.name)
}