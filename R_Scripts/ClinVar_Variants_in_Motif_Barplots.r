library(ggplot2)

#load in data which will be either for pathogenic or benign
#they will be the motif type, position in the motif, and type (SNP or indel)
data <- PositionCount_Path

#ERSEI
ggplot(subset(data, Motif %in% c("ERSEI")), aes(x=Position, color=Type)) + 
  geom_histogram(binwidth = 1, color='black', position='dodge', aes(fill=Type)) +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)) +
  ggtitle("ERSEI") +
  xlab("position") +
  scale_fill_manual(name="Type", values=c('gray', 'black')) +
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
ggplot(subset(data, Motif %in% c("ERSEII")), aes(x=Position, color=Type)) + 
  geom_histogram(binwidth = 1, color='black', position='dodge', aes(fill=Type)) +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10,11)) +
  ggtitle("ERSEII") +
  xlab("position") +
  scale_fill_manual(name="Type", values=c('gray', 'black')) +
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
ggplot(subset(data, Motif %in% c("UPRE")), aes(x=Position, color=Type)) + 
  geom_histogram(binwidth = 1, color='black', position='dodge', aes(fill=Type)) +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8)) +
  ggtitle("UPRE") +
  xlab("position") +
  scale_fill_manual(name="Type", values=c('gray', 'black')) +
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
ggplot(subset(data, Motif %in% c("ATF4")), aes(x=Position, color=Type)) + 
  geom_histogram(binwidth = 1, color='black', position='dodge', aes(fill=Type)) +
  scale_x_continuous(breaks = c(1,2,3,4,5,6,7,8,9,10)) +
  ggtitle("ATF4") +
  xlab("position") +
  scale_fill_manual(name="Type", values=c('gray', 'black')) +
  theme(panel.background = element_blank(),
        axis.line = element_line(color = 'black', lineend = 'round'),
        axis.title = element_text(size=19, color='black'),
        axis.text = element_text(size=17, color = 'black'),
        axis.title.y = element_text(size=19, color='black'),
        plot.title = element_text(hjust = 0.5, size=25),
        legend.text = element_text(size = 15),
        legend.title = element_text(size = 16, face = 'bold'),
        legend.position = 'top')
