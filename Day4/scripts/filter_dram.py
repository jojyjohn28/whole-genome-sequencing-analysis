import pandas as pd

dram = pd.read_csv("dram_out/annotations.tsv", sep="\t")
eps_keywords = pd.read_csv("eps_keywords.csv")

eps_hits = dram[
    dram["annotation"].str.contains(
        "|".join(eps_keywords["Keyword"]),
        case=False,
        na=False
    )
]

eps_hits.to_csv("eps_related_genes.tsv", sep="\t", index=False)

