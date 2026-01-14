#!/usr/bin/env python3
import pandas as pd
from collections import Counter

infile = "allclusters_final.tsv"
outfile = "core_pan_gene_counts_per_genome.tsv"

clusters = []
with open(infile) as f:
    for line in f:
        genes = [x.strip() for x in line.strip().split("\t") if x.strip()]
        clusters.append(genes)

def genome_name(g): return g.split("|")[0]

cluster_genomes = [list(set(genome_name(g) for g in cl)) for cl in clusters]
all_genomes = sorted({g for cl in cluster_genomes for g in cl})

core_clusters = [cl for cl in cluster_genomes if len(cl) == len(all_genomes)]
genome_counter = Counter(g for cl in cluster_genomes for g in cl)

summary = pd.DataFrame({
    "Genome": all_genomes,
    "Pan_genes": [genome_counter[g] for g in all_genomes],
})
summary["Core_genes"] = len(core_clusters)
summary["Accessory_genes"] = summary["Pan_genes"] - summary["Core_genes"]
summary["Core_fraction(%)"] = (summary["Core_genes"] / summary["Pan_genes"] * 100).round(2)

summary.to_csv(outfile, sep="\t", index=False)
print("✅ Saved:", outfile)
