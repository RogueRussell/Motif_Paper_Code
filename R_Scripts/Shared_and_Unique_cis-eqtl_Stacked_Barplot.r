library(ggplot2)

#CREATE TABLE OF TM and CONTROL SIG. eQTL OVERLAP##

mechanism <- c(rep("Sig. eQTL", 3))
Condition <- rep(c("TM", "Overlap", "Control"), 1)
value <- c(452612,370895,465220)
data <- data.frame(mechanism,Condition,value)

ggplot(data, aes(fill=Condition, y=value, x=mechanism)) + 
  geom_bar(position="fill", stat="identity") + xlab("") + ylab("Proportion of significant\neQTL in a given condition") +
  ggtitle("Unique and shared eQTL") + scale_fill_manual(values=c("blue","purple3","red")) +
  theme(
    plot.title = element_text(hjust=0.5, size=30),
    axis.title.y = element_text(size = 22),
    axis.text.y = element_text(size = 20, color = 'black'),
    axis.text.x = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(color = 'black'),
    legend.title = element_text(size = 20),
    legend.text = element_text(size = 17),
    axis.ticks.x = element_blank()
  )
