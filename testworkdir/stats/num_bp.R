
require(Cairo)
require(ggplot2)
#require(RColorBrewer)

data <- read.delim("./stats/num_bp.tab", header=TRUE)

data$frac_bp <- data$num_bp / sum(data$num_bp)
print(head(data))
data$bio_label <- ordered(data$bio_label, c('Quiescent', 'ConstitutiveHet', 'FacultativeHet', 'Transcribed', 'Promoter', 'Enhancer', 'RegPermissive', 'Bivalent', 'LowConfidence'))
p <- ggplot(data, aes(x=bio_label, y=frac_bp)) +
  geom_bar(stat="identity") +
  scale_x_discrete(name="") +
  scale_y_continuous(name="Fraction of genome") +
  coord_flip() +
  theme_classic()
ggsave("stats/num_bp.pdf", p, width=4, height=2.5, units="in")

p <- ggplot(data, aes(x=bio_label, y=frac_bp)) +
  geom_point() +
  scale_y_log10(breaks=c(0.001,0.003,0.01,0.03,0.1,0.3), name="Fraction of bases") +
  scale_x_discrete(name="") +
  theme_bw() +
  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
ggsave("stats/num_bp_log.pdf", p, width=4, height=5, units="in")
