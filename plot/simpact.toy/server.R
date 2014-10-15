library(SimpactUtility)
library(simpact)
library(shiny)
library(network)
#source(helpers.R)
# runApp('/Users/feimeng/SimpactUtility/plot/simpact.toy')
shinyServer(function(input, output) {
  
  output$toyPlot <- renderPlot({
    cfg<-list()
    cfg[['population.nummen']]<-input$nmen
    cfg[['population.numwomen']]<-input$nwomen
    cfg[['formation.hazard.agegap.baseline']]<-input$form.base
    cfg[['dissolution.alpha_0']]<-input$dis.base
    cfg[['hivseed.fraction']]<-input$seed.frac
    
    # temp
    out<-simpact.run(uni.configure(cfg),getwd())
    logfile<-out[1]
    logfile<-substr(logfile,1,nchar(logfile)-10)
    g<-simpact2network(logfile)
    FormTime<-get.edge.attribute(g,'FormTime')
    DisTime<-get.edge.attribute(g,'DisTime') 
    duration<-pmin(max(FormTime),get.edge.attribute(g,'DisTime'))-pmax(min(FormTime),get.edge.attribute(g,'FormTime'))
    set.edge.attribute(g,'Duration',duration)
    plot(g,vertex.col='Gender',edge.lwd='Duration')
    
  })
})