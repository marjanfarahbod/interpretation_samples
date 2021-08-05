
require(Cairo)
require(ggplot2)
#require(RColorBrewer)

data <- read.delim("./stats/num_celltypes.tab", header=TRUE)
data$bio_label <- ordered(data$bio_label, c('Quiescent', 'ConstitutiveHet', 'FacultativeHet', 'Transcribed', 'Promoter', 'Enhancer', 'RegPermissive', 'Bivalent', 'LowConfidence'))

p <- ggplot(data, aes(x=bio_label, y=num_celltypes)) +
  scale_y_continuous(name="Fraction of cell types with
at least one label", limits=c(0,1)) +
  geom_bar(stat="identity") +
  coord_flip() +
  theme_bw()
ggsave("stats/num_celltypes.pdf", p, width=6, height=5, units="in")
