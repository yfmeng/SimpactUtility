require(shiny)
simpact.shiny.plot<-function(app,dir){
  if(missing(dir)){dir<-getwd()}
  app.name<-sprintf('%s/plot.%s',folder,app)
  runApp(app.name)
}