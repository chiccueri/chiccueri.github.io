library(RColorBrewer)
library(ISLR)
data(Wage)

shinyServer(
  function(input, output) {
    output$wage <- renderPlot({
      x<-Wage[,as.numeric(input$var)]
      z<-as.factor(Wage[,as.numeric(input$var2)])
      seqz<-seq_along(levels(z))
      mw<-mean(Wage$wage)
      md<-median(Wage$wage)
      xname<-colnames(Wage[as.numeric(input$var)])
      zname<-colnames(Wage[as.numeric(input$var2)])
#      cols<-brewer.pal(length(z),"Spectral")
#      pal<-colorRampPalette(cols)
      pal<-colorRampPalette(c("black","red", "yellow"))(length(levels(z)))
      plot(x, Wage$wage, pch=16, xlab=xname, ylab="workers raw wage in US$", 
           main=paste('wage vs', xname, " (colored by ", zname, ")"), col=z)
     if(input$legend){legend("topright", pch=16, col=seqz, legend=levels(z))}
     if(input$cbmean){lines(c(0,100), c(mw,mw), col="darkmagenta", lwd=2)}
    })

#     output$wageMean <- renderPrint({paste("Mean = ",mean(Wage$wage))})
#      text (100, 100, label=paste("Mean = ",  mw), col="black")
#     if(input$cbmedian){lines(c(0,100), c(mw,mw), col="black", lwd =3)}
#      heigh=75
#      width=100
#      lines(c(mx1,mx1), c(0, 200), col="red", lwd =5)
#      lines(c(median(x1),median(x1)), c(0, 200), col="black", lwd =5)
#      mse <- mean((x1 - mx1)^2)
#      text (26, 480, paste("Mean = ",  mx1))
#      text (26, 460, paste("MSE = ", round(mse, 2)))
#      text (26, 440, paste("Median = ", median(x1)))
#    output$age  <- renderPlot({
#      x2<-Wage[,as.numeric(input$radio)]
#      mx2<-mean(x2)
#      qplot(x2, Wage$wage, colour=education, data=Wage)
#      hist(x2, xlab='', col='lightblue', main ='Age')
#      lines(c(mx2,mx2), c(0, 200), col="red", lwd =5)
#      lines(c(median(x2),median(x2)), c(0, 200), col="black", lwd =5)
#      mse <- mean((x2 - mx2)^2)
#      text (62, 170, paste("Mean = ",  mx2))
#      text (62, 160, paste("MSE = ", round(mse, 2)))
#      text (62, 150, paste("Median = ", median(x2)))
#    })
#    output$text1 <- renderText({paste("You have selected", input$var)
#    })
  }
)