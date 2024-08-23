#4.4.	Determine if there is any correlation between Total Hospital CABG Cases and Hospital Risk-Adjusted Adverse Events Rate (%,RAAER)?  

library(ggplot2)

df<-read.csv("C:/Users/Bittucharan/OneDrive - George Mason University - O365 Production/AIT/California Hospitals.csv", header=TRUE, encoding="latin1")

df$Total.Hospital.CABG.Cases<-as.numeric(df$Total.Hospital.CABG.Cases)

ggplot(df,aes(x=Total.Hospital.CABG.Cases))+
  geom_density(fill="skyblue", alpha=0.5)+
  labs(title="Density Plot of Total Hospital CABG Cases",
       x="Total Hospital CABG Cases",
       y="Density")+
  xlim(0, 1000)  

##5.Is there any correlation between Hospital Upper 95% CI for RAAER and Performance Rating?
library(ggplot2)

df$Hospital.Upper.95..CI.for.RAAER <- as.numeric(df$Hospital.Upper.95..CI.for.RAAER)

ggplot(df,aes(x=Hospital.Upper.95..CI.for.RAAER, y = Performance.Rating)) +
  geom_hex(color="white") +
  labs(title="Hexbin Plot of Hospital Upper 95% CI for RAAER vs. Performance Rating",
       x="Hospital Upper 95% CI for RAAER",
       y="Performance Rating") 