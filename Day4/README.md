# 🧬 Whole Genome Sequencing — Day 4

## Genome Annotation & Functional Potential

This directory contains workflows and helper scripts used in **Day 4** of the _Whole Genome Sequencing (WGS)_ blog series.  
The focus of this step is to **annotate genomes and interpret their functional and metabolic potential**, with special emphasis on **trait-based functional screening**.

This workflow is designed to scale from **single genomes to large genome collections (100+ genomes)**.

---

## 🎯 Objectives

- Predict protein-coding genes
- Assign functional annotations
- Reconstruct metabolic pathways
- Screen genomes for ecological traits (e.g., biofilm, EPS)
- Integrate functional traits with taxonomy and phylogeny

---

## 🧰 Annotation Tools Used

- **Prodigal** – Gene prediction
- **Prokka** – Rapid genome annotation
- **InterProScan** – Protein domain annotation
- **DRAM** – Metabolic and pathway-level annotation

---

## 📂 Directory Structure

```text
Day4/
├── README.md
└── scripts/
    ├── DRAM.sh                 # SLURM/cluster script for DRAM annotation
    ├── interproscan.sh         # InterProScan batch script
    ├── prokka.pbs              # Prokka annotation script (PBS-based)
    ├── filter_dram.py          # Filter DRAM annotations using keyword lists
    ├── filter_ipr.py           # Filter InterProScan outputs using keywords
    ├── merge_annotation.py     # Merge functional annotations with feature tables
    ├── screening_traits.R      # Keyword-based trait screening in R
    └── run_scripts.md          # How to run the Day 4 scripts

For more deatails visit:https://jojyjohn28.github.io/blog/wgs-day4-annotation-function/
```
