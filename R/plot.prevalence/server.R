library(shiny)
library(SimpactUtility)
#source(helpers.R)
shinyServer(function(input, output) {
  
  output$prevPlot <- renderPlot({
    age.range<-input$age
    time.range<-input$time
    gender<-input$gender
    # temp
    logfile<-"/Users/feimeng/Dropbox/Papers_FeiMeng/NetStructSim/Rproject/NetStructSim/test/test."
    g<-simpact.epidemic.summary(logfile,time.range,age.range)
    if (gender[1]==1){
      plot(g$male.positive/g$male.alive,ylim=c(0,g$max.prevalence+0.1),type='l',col='blue',xlab='Year',ylab='Prevalence')
    }
    if (gender[1]==2){
      plot(g$female.positive/g$female.alive,ylim=c(0,g$max.prevalence+0.1),type='l',col='red',xlab='Year',ylab='Prevalence')
    }
    if(length(gender)==2){
      plot(g$male.positive/g$male.alive,ylim=c(0,g$max.prevalence+0.1),type='l',col='blue',xlab='Year',ylab='Prevalence')
      lines(g$female.positive/g$female.alive,ylim=c(0,g$max.prevalence+0.1),type='l',col='red')
    }
  })
})