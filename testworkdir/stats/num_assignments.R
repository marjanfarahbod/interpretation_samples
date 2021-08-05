
require(Cairo)
require(ggplot2)
#require(RColorBrewer)

data <- read.delim("./stats/num_assignments.tab", header=TRUE)
data$bio_label <- ordered(data$bio_label, c('Quiescent', 'ConstitutiveHet', 'FacultativeHet', 'Transcribed', 'Promoter', 'Enhancer', 'RegPermissive', 'Bivalent', 'LowConfidence'))

p <- ggplot(data, aes(x=bio_label, y=frac_assignments)) +
  geom_bar(stat="identity") +
  scale_y_continuous(name="Average number of
labels per cell type") +
  scale_x_discrete(name="") +
  coord_flip() +
  theme_bw() +
  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
ggsave("stats/num_assignments.pdf", p, width=4, height=4, units="in")
