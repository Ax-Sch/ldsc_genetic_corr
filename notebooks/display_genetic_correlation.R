library(tidyverse)

rgs<-read.table("data_extract.tsv", header=TRUE)


rgs<-rgs %>% mutate(p1=str_replace(string = p1,pattern = ".sumstats.gz", replacement = "")) %>%
        mutate(p1=str_replace(string = p1,pattern = "results/ldsc/munged/", replacement = "")) %>%
  mutate(p2=str_replace(string = p2,pattern = ".sumstats.gz", replacement = "")) %>%
  mutate(p2=str_replace(string = p2,pattern = "results/ldsc/munged/", replacement = ""))

rgs<-rbind(rgs, 
           rgs %>% rename(p1=p2, p2=p1))

rgs

genetic_correlation_plot<-ggplot(rgs, aes(x = p1, y = p2, fill = rg, 
                                          label=paste0("rg: ",rg, "\np: ", p))) +
  geom_tile(color = "white") +  # Add white borders for better distinction
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0) +
  geom_text( color = "black", size = 3) +  # Add p-values # aes(label = sprintf("%.5f", p))
  labs(
    x = "p1",
    y = "p2",
    fill = "rg",
    title = "Heatmap of rg values between p1 and p2"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

genetic_correlation_plot

ggsave(plot = genetic_correlation_plot, filename = "genetic_correlation_plot.pdf", 
       width=6, height=6)
