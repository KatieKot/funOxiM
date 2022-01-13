library("RColorBrewer")
library("ggthemes")
set.seed(1234)
options(scipen=999)

theme_Publication <- function(base_size=10, base_family="Helvetica") {

      (theme_foundation(base_size=base_size, base_family=base_family) + 
        theme(
               text = element_text(family = base_family, size = base_size, color = "black"),

               panel.background = element_rect(fill = "transparent", colour = NA),
               panel.border = element_blank(),

               plot.background = element_rect(fill = "transparent", colour = NA),
               
               panel.grid.major = element_line(colour="#f0f0f0", linetype="dotted"),
               panel.grid.minor = element_blank(),
               axis.line = element_line(colour="black"),
               axis.text = element_text(size=base_size, color="black"),
               axis.ticks = element_line(size=0.3, color="black"),
               axis.title = element_text(size = rel(1.0), color="black"),
               
               strip.background=element_blank(),
               strip.text.x = element_text(size=base_size, color="black"),
               strip.text.y = element_text(size=base_size, color="black", angle = 0),

              legend.background = element_rect(
                    fill = alpha("white", 0),
                    color = alpha("white", 0)
                  ),
              legend.key = element_rect(color = NA, fill = NA),
              plot.margin=unit(c(0, 0, 0, 0),"mm"),
              legend.key.size = unit(0.5, "line"),
              legend.text = element_text(size = base_size),

              plot.tag=element_text(size=18, face="bold")
               
          ))      
}


col_clusters <- c("#E69F00", "#0072b2")
col_TE <- c("#009E73", "#D55E00")
col_rep <- c("#56B4E9", "#F0E442")
col_multi <- c("#E69F00", "#009E73")
col_elementai = brewer.pal(n = 12, "Paired")[7:12] 
col_enrich <- c("#F0E442", "#E69F00", "#009E73", "#999999", "#56B4E9", "#0072B2", "#D55E00", "#CC79A7")
col_nine <- c("#145c34", "#009E73", "#94f2d8", "#003452", "#0072B2", "#56B4E9", "#b08613", "#E69F00", "#f0c975")
col_clTE <- c("#E69F00", "#009E73", "#D55E00", "#0072b2")

