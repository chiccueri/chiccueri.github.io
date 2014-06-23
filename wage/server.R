#library(RColorBrewer)
library(ISLR)
data(Wage)

shinyServer(
  function(input, output) {
    output$wage <- renderPlot({
      x<-Wage[,as.numeric(input$var)]
#      z<-as.factor(Wage[,as.numeric(input$var2)])
#      seqz<-seq_along(levels(z))
      mw<-mean(Wage$wage)
      md<-median(Wage$wage)
      xname<-colnames(Wage[as.numeric(input$var)])
#      zname<-colnames(Wage[as.numeric(input$var2)])
#      pal<-colorRampPalette(c("black","red", "yellow"))(length(levels(z)))
      plot(x, Wage$wage, pch=16, xlab=xname, ylab="workers raw wage in US$", 
           main=paste('wage vs', xname))
#      plot(x, Wage$wage, pch=16, xlab=xname, ylab="workers raw wage in US$", 
#           main=paste('wage vs', xname, " (colored by ", zname, ")"), col=z)
#     if(input$legend){legend("topright", pch=16, col=seqz, legend=levels(z))}
     if(input$cbmean){lines(c(0,100), c(mw,mw), col="red", lwd=2)}
    })
  }
)