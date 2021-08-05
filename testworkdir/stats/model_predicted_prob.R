
    require(Cairo)
    require(ggplot2)
    require(reshape2)
    require(RColorBrewer)

    data <- read.delim("./stats/model_predicted_prob.tab", header=TRUE)

    p <- ggplot(data) +
      aes(x=prob) +
      stat_ecdf() +
      scale_x_continuous(limits=c(0,1)) +
      theme_bw()
    ggsave(paste("stats/model_predicted_prob_ecdf.pdf", sep=""), p, width=10, height=6, units="in")
    