
require(Cairo)
require(ggplot2)
require(RColorBrewer)

data <- read.delim("./stats/mean_feature_vals.tab", header=TRUE)

data$bio_label <- ordered(data$bio_label, c('Quiescent', 'ConstitutiveHet', 'FacultativeHet', 'Transcribed', 'Promoter', 'Enhancer', 'RegPermissive', 'Bivalent', 'LowConfidence'))
data$feature_mean_disc <- cut(data$feature_mean, breaks=c(-Inf, -1.5, -1.0, -0.5, 0, 0.5, 1.0, 1.5, Inf))
palette="RdBu"
colors <- brewer.pal(palette, n=length(levels(data$feature_mean_disc)))
color_mapping <- levels(data$feature_mean_disc)
colors <- rev(colors)

p <- ggplot(data) +
  aes(x=bio_label, y=feature_name, fill=feature_mean_disc) +
  geom_tile() +
  scale_fill_manual(values=colors, breaks=color_mapping, drop=FALSE, name="Feature
value") +
  scale_y_discrete(name="") +
  scale_x_discrete(name="") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
ggsave("stats/mean_feature_vals.pdf", p, width=6, height=4.5, units="in")
