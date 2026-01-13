library(readr)
library(dplyr)
library(stringr)

# Load annotation table (InterProScan or DRAM output)
annotation <- read_tsv("annotation_table.tsv")

# Load keyword list
keywords <- read_lines("trait_keywords.txt")

# Screen for matching annotations
trait_hits <- annotation %>%
  filter(
    str_detect(
      tolower(annotation_description),
      str_c(keywords, collapse = "|")
    )
  )

# Save results
write_tsv(trait_hits, "trait_related_genes.tsv")

cat("Trait-based screening complete.\n")
