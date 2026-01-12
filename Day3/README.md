# 🧬 Whole Genome Sequencing — Day 3

## Taxonomy, Phylogeny & Genome Similarity

This directory contains scripts and outputs for **Day 3** of the _Whole Genome Sequencing (WGS)_ blog series.  
The focus of this step is to place assembled genomes in a **taxonomic and evolutionary context** using genome-based methods.

This workflow is designed to scale from **tens to hundreds of genomes**, including isolate genomes and MAG collections.

---

## 🎯 Objectives

- Assign **standardized genome taxonomy**
- Construct **phylogenomic trees**
- Prepare outputs for **species/genus boundary analyses**
- Generate **publication-ready trees** for visualization

---

## 🧰 Tools Used

- **GTDB-Tk** – Genome-based taxonomy and phylogeny
- **iTOL** – Interactive Tree of Life (visualization)

---

## 📂 Directory Contents

```text
Day3/
├── gtdbtk_classify.sh   # Identify → align → classify genomes (taxonomy)
├── gtdbtk_denovo.sh     # Phylogenomic tree construction + iTOL export
└── OUTPUT_TREE/         # iTOL-ready tree and metadata files
```
