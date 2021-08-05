
require(Cairo)
require(ggplot2)
require(reshape2)
require(RColorBrewer)

data <- read.delim("./indiv/Not-Normalized/classification_features.tab", header=TRUE)

data$feature_val_disc <- cut(data$feature_val, breaks=c(-Inf, -1.5, -1.0, -0.5, 0, 0.5, 1.0, 1.5, Inf))
palette="RdBu"
colors <- brewer.pal(palette, n=length(levels(data$feature_val_disc)))
color_mapping <- length(levels(data$feature_val_disc))
colors <- rev(colors)
data$label_celltype_key <- as.factor(paste(data$celltype, "_", data$int_label, "___", data$bio_label, sep=""))

p <- ggplot(data) +
  aes(x=feature_val) +
  stat_ecdf() +
  scale_x_continuous(breaks=seq(-2,5,0.5), limits=c(-3,5)) +
  scale_y_continuous(breaks=seq(0,1,0.1)) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
ggsave(paste("indiv/Not-Normalized/classification_features_ecdf.pdf", sep=""), p, width=10, height=6, units="in")

common_celltypes = unique(data$celltype)
for (i in common_celltypes) {
print(i)
p <- ggplot(data[data$celltype==i,], aes(x=label_key, y=feature_name, fill=feature_val_disc)) +
  geom_tile() +
  ggtitle(i) +
  scale_fill_manual(values=colors) +
  scale_y_discrete(name="Feature") +
  scale_x_discrete(name="Label") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90))
ggsave(paste("indiv/Not-Normalized/Clusters/classification_features_normalize_",i,".pdf", sep=""), p)
}

for (i in common_celltypes) {
print(i)
p <- ggplot(data[data$celltype==i,], aes(x=bio_label, y=feature_name, fill=feature_val_disc)) +
  geom_tile() +
  ggtitle(i) +
  scale_fill_manual(values=colors) +
  scale_y_discrete(name="Feature") +
  scale_x_discrete(name="Label") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90))
ggsave(paste("indiv/Not-Normalized/Bio-labels/classification_features_normalized_",i,".pdf", sep=""), p)
}

label_key_order <- c()
cast_data <- acast(data, label_celltype_key ~ feature_name, value.var="feature_val")
ord <- hclust( dist(cast_data, method = "euclidean") )$order
data$label_celltype_key <- factor(data$label_celltype_key, levels=rownames(cast_data)[ord])

p <- ggplot(data, aes(y=label_celltype_key, x=feature_name, fill=feature_val_disc)) +
  geom_tile() +
  scale_fill_manual(values=colors, breaks=color_mapping, drop=FALSE) +
  scale_x_discrete(name="Feature") +
  scale_y_discrete(name="Label") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))
ggsave("indiv/Not-Normalized/classification_features_all.pdf", p, width=15, height=350, units="in", limitsize=FALSE)
