library(tidyverse)

df <- read_tsv("quast_gc_summary.tsv") #load your table

ggplot(df, aes(x = Sample, y = GC)) +
  geom_col(fill = "steelblue") +
  theme_minimal() +
  labs(
    title = "GC Content Across Genome Assemblies",
    x = "Genome",
    y = "GC (%)"
  ) +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))
