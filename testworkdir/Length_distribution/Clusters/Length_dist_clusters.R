
	require(Cairo)
	require(ggplot2)

	data <- read.delim("../segwayOutput/trophoblast_cell/glob-a287da44f32bf6a3fc6d7c51c52ddafa/length_distribution.tab", header=TRUE)

	p <- ggplot(data[data$length <= 3000 ,], aes(x=length)) +
	  geom_histogram(binwidth=100, colour="black", fill="white") +
	  #geom_density() +
	  facet_wrap( ~ label ,scales = "free")
	ggsave("Length_distribution/Clusters/trophoblast_cell_hist.pdf", p)
	