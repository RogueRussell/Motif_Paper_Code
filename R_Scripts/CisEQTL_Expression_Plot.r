#Data should have Log2Intensity column, Probe ID column, and Genotype Column (HOMO or HET)
library(ggplot2)
data <- Expression_data

#LOG2INTENSITY
ggplot(data, aes(x=ProbeID, y=TM, fill=genotype)) + 
  geom_boxplot(position=position_dodge(0.9), outlier.shape = NA) +
  geom_dotplot(binaxis='y', stackdir = 'center', stackratio = .6, position=position_dodge(0.9), dotsize = 0.6) +
  ggtitle("Uba6") +
  xlab("Genotype") + ylab("TMLog2Intensity") +
  scale_fill_manual(name = "Genotype", labels = c("HomoRef", "Het", "HomoAlt"), values=c("Red3", "Purple3", "royalblue3")) +
  theme(
    plot.title = element_text(hjust=0.5, size=30, face = 'italic'),
    axis.title.y = element_text(size = 25),
    axis.text.y = element_text(size = 20, color = 'black'),
    axis.text.x = element_text(size = 20, color = 'black'),
    axis.title.x = element_text(size = 25),
    legend.title = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(color='black'),
    legend.text = element_text(size = 15) ,
    strip.text.x = element_text(size = 17)
  )
