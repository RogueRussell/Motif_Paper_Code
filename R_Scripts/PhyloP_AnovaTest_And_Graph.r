library(ggplot2)

#load the data in which is a table with two columns, first is position within the motif, and second is phylop score at that position
#the example here is for UPRE
data <- UPRE_PositionConservation_PhyloP

data$Position <- as.character(data$Position)
#change the levels to how many positions are in the motif - UPRE has 8 which is why there are 8
data$Position <- factor(data$Position, levels=c("1", "2", "3", "4", "5", "6", "7", "8"))
ggplot(data, aes(x=Position, y=Score)) +
  geom_boxplot() +
  ylab("PhyloP Score") + ggtitle("UPRE") +
  theme(
    plot.title = element_text(hjust=0.5, size=30),
    axis.title.y = element_text(size = 25),
    axis.text.y = element_text(size = 20, color = 'black'),
    axis.text.x = element_text(size = 20, color = 'black'),
    axis.title.x = element_text(size = 25),
    legend.title = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(color='black'),
    legend.text = element_text(size = 15) ,
    strip.text.x = element_text(size = 17)
  ) + geom_hline(yintercept=0, color = 'red')


#This is the anova test to determine if there is signficant difference in average phyloP score for each position
#This will create a new factor variable indicating whether each position is 1 or not
#this will be repeated for each position
position_1 <- factor(ifelse(data$Position == 1, "1", "not 1"))

# Perform the ANOVA using the new factor variable
anova_results <- aov(data$Score ~ position_1)

# Perform the HSD test using the Tukey method
hsd_results <- TukeyHSD(anova_results)

# View the HSD results
print(hsd_results)
