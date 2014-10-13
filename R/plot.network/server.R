library(shiny)
library(SimpactUtility)
library(network)
#source(helpers.R)
shinyServer(function(input, output) {
  
  output$netPlot <- renderPlot({
    age.range<-input$age
    time.range<-input$time
    # temp
    logfile<-"/Users/feimeng/Dropbox/Papers_FeiMeng/NetStructSim/Rproject/NetStructSim/test/test."
    g<-simpact2network(logfile)
    TOB<-get.vertex.attribute(g,'TOB')
    delete.nodes<-(TOB+age.range[1])>time.range[2]|(TOB+age.range[2])<time.range[1]
    g<-delete.vertices(g,delete.nodes)
    FormTime<-get.edge.attribute(g,'FormTime')
    DisTime<-get.edge.attribute(g,'DisTime')
    duration<-pmin(time.range[2],DisTime)-pmax(time.range[1],FormTime)
    set.edge.attribute(g,'Duration',duration)
    g<-delete.edges(g,which(FormTime>time.range[2]|DisTime<time.range[1]))
    plot(g,vertex.col='Gender',edge.lwd='Duration')
    
  })
})