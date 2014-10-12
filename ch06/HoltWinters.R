> library(forecast)                                       

> fit <- HoltWinters(webts, beta=FALSE, gamma=FALSE)
> fit
> forecast(fit, 5) 
> plot(forecast(fit, 5))                                     

> fit <- HoltWinters(webts, gamma=FALSE)
> fit 
> forecast(fit, 5)
> plot(forecast(fit, 5))                                           
