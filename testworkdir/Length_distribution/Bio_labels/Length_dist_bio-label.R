
	require(Cairo)
	require(ggplot2)

	data <- read.csv("Length_distribution/Bio_labels/length_distr_df_temp.csv", header=TRUE)

	p <- ggplot(data[data$length <= 3000 ,], aes(x=length)) +
	  geom_histogram(binwidth=100, colour="black", fill="white") +
	  #geom_density() +
	  facet_wrap( ~ bio_label ,scales = "free")
	ggsave("Length_distribution/Bio_labels/trophoblast_cell_hist.pdf", p)
	