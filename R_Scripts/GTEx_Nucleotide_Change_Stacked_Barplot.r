library(ggplot2)
#load in the data which is just the type of motif, position of the motif, and category (as in what the nucleotide change is)
#example of category is 'G->A' or 'C->T'
data <- Nucleotide_Data

#all colors were later manually changed in adobe illustrator to make all categories except C->T and G->A gray

#ERSEI
ggplot(subset(data, Type %in% c("ERSEI")), aes(x=Position)) + 
  geom_bar(aes(fill=Category)) +
  ggtitle("ERSEI") +
  xlab("position") + ylab("count") +
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
ggplot(subset(data, Type %in% c("ERSEII")), aes(x=Position)) + 
  geom_bar(aes(fill=Category)) +
  ggtitle("ERSEII") +
  xlab("position") + ylab("count") +
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
ggplot(subset(data, Type %in% c("UPRE")), aes(x=Position)) + 
  geom_bar(aes(fill=Category)) +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)) +
  ggtitle("UPRE") +
  xlab("position") + ylab("count") +
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
ggplot(subset(data, Type %in% c("ATF4")), aes(x=Position)) + 
  geom_bar(aes(fill=Category)) +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)) +
  ggtitle("ATF4") +
  xlab("position") + ylab("count") +
  theme(panel.background = element_blank(),
        axis.line = element_line(color = 'black', lineend = 'round'),
        axis.title = element_text(size=19, color='black'),
        axis.text = element_text(size=17, color = 'black'),
        axis.title.y = element_text(size=19, color='black'),
        plot.title = element_text(hjust = 0.5, size=25),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16, face = 'bold'),
        legend.position = 'top')
