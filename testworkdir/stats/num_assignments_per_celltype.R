
require(Cairo)
require(ggplot2)
require(RColorBrewer)

data <- read.delim("./stats/num_assignments_per_celltype.tab", header=TRUE)
data$bio_label <- ordered(data$bio_label, c('Quiescent', 'ConstitutiveHet', 'FacultativeHet', 'Transcribed', 'Promoter', 'Enhancer', 'RegPermissive', 'Bivalent', 'LowConfidence'))

p <- ggplot(data, aes(x=num_assignments)) +
  stat_bin() +
  facet_grid(bio_label ~ .) +
  scale_x_continuous(name="Number of assignments in a given cell type") +
  scale_y_continuous(name="Number of cell types") +
  theme_bw()
ggsave("stats/num_assignments_per_celltype.pdf", p, width=6, height=8, units="in")
