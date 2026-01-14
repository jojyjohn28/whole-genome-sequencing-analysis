# 🧬 Whole Genome Sequencing — Day 5

## Comparative & Downstream Genomic Analyses

This directory contains workflows and helper scripts used in **Day 5** of the _Whole Genome Sequencing (WGS)_ blog series.

The focus of this step is to **move from individual genomes to comparative insights** by analyzing gene content variation, biosynthetic potential, antimicrobial resistance, and mobile genetic elements.

This workflow is designed to scale from **small genome sets to large collections (100+ genomes)**.

---

## 🎯 Objectives

- Perform pangenome analysis (core vs. accessory genes)
- Identify secondary metabolite biosynthetic gene clusters
- Screen for antimicrobial resistance (AMR) genes and virulence factors
- Detect and characterize plasmids
- Validate genome topology and completeness
- Integrate comparative results with phylogeny and ecology

---

## 🧰 Tools Used

- **PanX** – Pangenome analysis and visualization
- **antiSMASH** – Secondary metabolite BGC prediction
- **BiG-SCAPE** – BGC similarity networks
- **Abricate** – AMR and virulence screening (CARD, ResFinder, ARG-ANNOT, VFDB)
- **Plasmer** – Plasmid identification
- **PlasmidFinder** – Plasmid replicon detection
- **SPAdes (plasmidSPAdes)** – Plasmid assembly
- **Prokka** – Plasmid annotation

---

## 📂 Directory Structure

```text
Day5/
├── README.md
└── scripts/
    ├── prokka.pbs              # Genome annotation with Prokka (PBS format)
    ├── abricate.sh             # Batch AMR and virulence screening
    ├── comp_screening.sh       # Comprehensive pathogen screening workflow
    ├── antismash.sh            # Secondary metabolite BGC prediction
    ├── core_pan_from_list.py   # Generate pangenome from genome list
    └── run_scripts.md          # How to run the Day 5 scripts
```

---

## 🔑 Key Analyses

### 1️⃣ Pangenome Analysis

Identify core genes (present in all genomes) and accessory genes (strain-specific) to understand functional diversity.

### 2️⃣ AMR & Virulence Screening

Screen genomes against multiple databases (CARD, ResFinder, ARG-ANNOT, VFDB) to identify resistance and pathogenicity potential.

### 3️⃣ Secondary Metabolite Potential

Predict biosynthetic gene clusters (BGCs) for antibiotics, toxins, and other bioactive compounds.

### 4️⃣ Plasmid Detection

Identify and characterize mobile genetic elements that carry AMR genes and other ecologically relevant traits.

---

## 🧠 Downstream Integration

Outputs from Day 5 can be:

- Combined with **Day 3 phylogeny** for trait mapping
- Merged with **Day 4 functional annotations** for pathway analysis
- Visualized in **iTOL** as heatmaps, metadata strips, or presence/absence matrices

This enables **comparative functional genomics** and **ecological stratification**.

---

## 📘 Related Blog Post

**Whole Genome Sequencing — Day 5: Comparative & Downstream Genomic Analyses**

For more details visit:  
**https://jojyjohn28.github.io/blog/wgs-day5-comparative-genomics/**

GitHub repository:  
**https://github.com/jojyjohn28/whole-genome-sequencing-analysis/tree/main/Day5**
