# 🧬 Day 4 — Functional Screening Scripts

## Genome Annotation & Trait-Based Filtering

This directory contains helper scripts used in **Day 4** of the _Whole Genome Sequencing (WGS)_ blog series.  
These scripts support **trait-based functional screening** by filtering annotation outputs and merging them with quantitative or taxonomic data.

The workflow is designed to scale to **large genome collections (100+ genomes)**.

---

## 📂 Scripts Overview

````text
scripts/
├── filter_dram.py        # Screen DRAM annotations using keyword lists
├── filter_ipr.py         # Screen InterProScan annotations using keyword lists
├── merge_annotation.py   # Merge functional annotations with feature tables
└── screening_traits.R    # Keyword-based trait screening in R

# 🚀 Typical Workflow Order

1️⃣ Filter functional annotations (DRAM / InterProScan)
2️⃣ Merge screened traits with abundance or expression data
3️⃣ Integrate results with taxonomy and phylogeny (e.g., iTOL)

# 🔍 Script Descriptions

1️⃣ filter_dram.py

Filters DRAM annotation outputs to identify genes associated with specific traits (e.g., EPS production, carbohydrate utilization).

Inputs

● annotations.tsv (from DRAM)

● Keyword reference file (CSV or TXT)

Output

● Trait-specific gene list (*_filtered.tsv)

```bash
python filter_dram.py \
  --dram annotations.tsv \
  --keywords eps_keywords.txt \
  --out eps_related_genes.tsv
````

2️⃣ filter_ipr.py

Filters InterProScan TSV outputs using keyword or domain-based references (e.g., biofilm, adhesion, pili).

Inputs

● InterProScan TSV file

● Keyword reference file

Output

● Trait-related protein list

```bash
python filter_ipr.py \
  --ipr genome.interpro.tsv \
  --keywords biofilm_keywords.txt \
  --out biofilm_related_genes.tsv
```

3️⃣ merge_annotation.py

Merges functional screening results with feature tables (abundance, expression, or presence/absence).

Inputs

● Feature table (Excel or TSV)

● Annotation table

● Shared gene identifier column

Outputs

● Matched features

● Non-matched features

```bash
python merge_annotation.py \
  --features feature_table.xlsx \
  --annotation annotation.xlsx \
  --key Geneid
```

4️⃣ screening_traits.R

An R-based alternative for keyword-driven screening and quick exploratory analysis.

Inputs

● Annotation table (InterProScan or DRAM)

● Keyword list

Output

● Filtered trait-related gene table

```bash
Rscript screening_traits.R \
  annotation_table.tsv \
  trait_keywords.txt \
  trait_related_genes.tsv
```

# 🧠 Downstream Use

Outputs from these scripts can be:

● Combined with GTDB taxonomy

● Mapped onto phylogenomic trees

● Visualized in iTOL as:

● Metadata strips

● Presence/absence heatmaps

**This enables rapid comparison of functional traits across clades.**

📌 Notes

● Keyword lists should be curated and version-controlled

● Trait screening is hypothesis-generating, not definitive

● Combine with pathway context and expression data when available

📘 Related blog post:
Whole Genome Sequencing — Day 4: Genome Annotation & Functional Potential
Please visit:
For more deatails visit:https://jojyjohn28.github.io/blog/wgs-day4-annotation-function/
