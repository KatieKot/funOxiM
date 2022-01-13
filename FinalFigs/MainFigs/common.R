library("RColorBrewer")
library("ggpubr")
library("ggthemes")
set.seed(1234)
options(scipen=999)

theme_Publication <- function(font = 8) {
  theme(
    text = element_text(family = "Helvetica", size = font, color = "black"),

    panel.background = element_rect(fill = "transparent", colour = NA),
    panel.border = element_blank(),
    plot.background = element_rect(fill = "transparent", colour = NA),

    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),

    axis.line = element_line(color = "black"),
    axis.text = element_text(size = font, color = "black"),
    axis.ticks = element_line(size = 0.3, color = "black"),
    axis.title = element_text(size = font, color = "black"),

    strip.background = element_rect(color = "white", fill = "white"),
    strip.text.x = element_text(size = font, color = "black"),
    strip.text.y = element_text(size = font, color = "black", angle = 0),

    legend.background = element_rect(
      fill = alpha("white", 0),
      color = alpha("white", 0)
    ),
    legend.key = element_rect(color = NA, fill = NA),
    legend.key.size = unit(0.2, "cm"),
    legend.text = element_text(size = font)
  )
}


col_clusters <- c("#E69F00", "#0072b2")
col_TE <- c("#009E73", "#D55E00")
col_rep <- c("#56B4E9", "#F0E442")
col_multi <- c("#E69F00", "#009E73")
col_elementai = brewer.pal(n = 12, "Paired")[7:12] 
col_enrich <- c("#F0E442", "#E69F00", "#009E73", "#999999", "#56B4E9", "#0072B2", "#D55E00", "#CC79A7")
col_nine <- c("#145c34", "#009E73", "#94f2d8", "#192363", "#0072B2", "#56B4E9", "#b08613", "#E69F00", "#f0c975")
col_clTE <- c("#E69F00", "#009E73", "#D55E00", "#0072b2")
#brewer.pal(n = 12, "Paired")[1:7] 
#0072b2 - melyna
#56B4E9 - sviesi melyna
#E69F00 - sodri geltona 
#F0E442 - sviesi geltona
#009E73 - zalia
#D55E00 - oranzine