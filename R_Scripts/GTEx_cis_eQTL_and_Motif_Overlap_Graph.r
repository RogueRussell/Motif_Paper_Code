library(ggplot2)
#load in data which will just be motif type and position of the motif that the GTEx cis- eQTL falls on
data <- GtexData

#ERSEI
ggplot(subset(data, Type %in% c("ERSEI")), aes(x=Position)) + 
  geom_histogram(binwidth = 1, color = 'black', fill = 'white') +  
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)) +
  ggtitle("ERSEI") +
  xlab("position") +
  theme(legend.position="none",
    panel.background = element_blank(),
    axis.line = element_line(color = 'black', lineend = 'round'),
    axis.title = element_text(size=19, color='black'),
    axis.text = element_text(size=17, color = 'black'),
    axis.title.y = element_text(size=19, color='black'),
    plot.title = element_text(hjust = 0.5, size=25),
    legend.text = element_text(size = 15),
    legend.title = element_text(size = 16))

#ERSEII
ggplot(subset(data, Type %in% c("ERSEII")), aes(x=Position)) + 
  geom_histogram(binwidth = 1, color = 'black', fill = 'white') +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11)) +
  ggtitle("ERSEII") +
  xlab("position") +
  theme(legend.position="none",
        panel.background = element_blank(),
        axis.line = element_line(color = 'black', lineend = 'round'),
        axis.title = element_text(size=19, color='black'),
        axis.text = element_text(size=17, color = 'black'),
        axis.title.y = element_text(size=19, color='black'),
        plot.title = element_text(hjust = 0.5, size=25),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16))

#UPRE
ggplot(subset(data, Type %in% c("UPRE")), aes(x=Position)) + 
  geom_histogram(binwidth = 1, color = 'black', fill = 'white') +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8)) +
  ggtitle("UPRE") +
  xlab("position") +
  theme(legend.position="none",
        panel.background = element_blank(),
        axis.line = element_line(color = 'black', lineend = 'round'),
        axis.title = element_text(size=19, color='black'),
        axis.text = element_text(size=17, color = 'black'),
        axis.title.y = element_text(size=19, color='black'),
        plot.title = element_text(hjust = 0.5, size=25),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16))

#ATF4
ggplot(subset(data, Type %in% c("ATF4")), aes(x=Position)) + 
  geom_histogram(binwidth = 1, color = 'black', fill = 'white') +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10)) +
  ggtitle("ATF4") +
  xlab("position") +
  theme(legend.position="none",
        panel.background = element_blank(),
        axis.line = element_line(color = 'black', lineend = 'round'),
        axis.title = element_text(size=19, color='black'),
        axis.text = element_text(size=17, color = 'black'),
        axis.title.y = element_text(size=19, color='black'),
        plot.title = element_text(hjust = 0.5, size=25),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16))
