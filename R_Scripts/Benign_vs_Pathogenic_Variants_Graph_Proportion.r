library(ggplot2)
#load in the data, there are four different files you will need to fill in for each motif
#for proportions, they should be proportion, significance, and position
data <- ERSEII_Proportion_Path_Benign

#for a stacked bar plot that shows proportion for benign and pathogenic at each position
#data should be significance, and which position it fell within
data <- ERSEII_Count_Path_benign

#you will do similar to below, such as stat = 'identity', but use position = 'fill' - that will make it add up to 1

#ERSEI
ggplot(data, aes(x=Position, y=Proportion, fill=Significance)) +
  geom_bar(stat = 'identity', position = position_dodge(), color = 'black', aes(fill = Significance)) +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)) +
  ggtitle("ERSEI") +
  xlab("position") + ylab("proportion") +
  scale_fill_manual(name="Significance", values=c('gray', 'red')) +
  theme(panel.background = element_blank(),
        axis.line = element_line(color = 'black', lineend = 'round'),
        axis.title = element_text(size=19, color='black'),
        axis.text = element_text(size=17, color = 'black'),
        axis.title.y = element_text(size=19, color='black'),
        plot.title = element_text(hjust = 0.5, size=25),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16, face = 'bold'),
        legend.position = 'top')

#ERSEII
ggplot(data, aes(x=Position, y=Proportion, fill=Significance)) +
  geom_bar(stat = 'identity', position = position_dodge(), color = 'black', aes(fill = Significance)) +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11)) +
  ggtitle("ERSEII") +
  xlab("position") + ylab("proportion") +
  scale_fill_manual(name="Significance", values=c('gray', 'red')) +
  theme(panel.background = element_blank(),
        axis.line = element_line(color = 'black', lineend = 'round'),
        axis.title = element_text(size=19, color='black'),
        axis.text = element_text(size=17, color = 'black'),
        axis.title.y = element_text(size=19, color='black'),
        plot.title = element_text(hjust = 0.5, size=25),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16, face = 'bold'),
        legend.position = 'top')

#UPRE
ggplot(data, aes(x=Position, y=Proportion, fill=Significance)) +
  geom_bar(stat = 'identity', position = position_dodge(), color = 'black', aes(fill = Significance)) +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8)) +
  ggtitle("UPRE") +
  xlab("position") + ylab("proportion") +
  scale_fill_manual(name="Significance", values=c('gray', 'red')) +
  theme(panel.background = element_blank(),
        axis.line = element_line(color = 'black', lineend = 'round'),
        axis.title = element_text(size=19, color='black'),
        axis.text = element_text(size=17, color = 'black'),
        axis.title.y = element_text(size=19, color='black'),
        plot.title = element_text(hjust = 0.5, size=25),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16, face = 'bold'),
        legend.position = 'top')

#ATF4
ggplot(data, aes(x=Position, y=Proportion, fill=Significance)) +
  geom_bar(stat = 'identity', position = position_dodge(), color = 'black', aes(fill = Significance)) +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10)) +
  ggtitle("ATF4") +
  xlab("position") + ylab("proportion") +
  scale_fill_manual(name="Significance", values=c('gray', 'red')) +
  theme(panel.background = element_blank(),
        axis.line = element_line(color = 'black', lineend = 'round'),
        axis.title = element_text(size=19, color='black'),
        axis.text = element_text(size=17, color = 'black'),
        axis.title.y = element_text(size=19, color='black'),
        plot.title = element_text(hjust = 0.5, size=25),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16, face = 'bold'),
        legend.position = 'top')

