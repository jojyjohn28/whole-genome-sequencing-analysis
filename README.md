## Whole Genome Sequencing Analysis — From Raw Reads to Biological Insight

This repository documents a **step-by-step, reproducible whole-genome sequencing (WGS) analysis workflow**, developed and applied to bacterial genomes generated from both **Illumina (short-read)** and **Oxford Nanopore (long-read)** sequencing.

The project is organized as a **daily analysis series**, where each day focuses on a logical stage of genome analysis — from raw sequencing data to comparative genomics and functional interpretation.

All workflows are designed to be:
- HPC-ready (SLURM, batch scripts)
- Modular and reusable
- Transparent and reviewer-safe
- Closely aligned with real research use cases

---

## Project Structure & Roadmap

### **Day 1 — Raw Reads to Clean, Analysis-Ready Data**
**Goal:** Ensure data integrity and quality before assembly.

**Topics**
- Raw read formats (Illumina & ONT)
- File integrity checks (md5sum)
- Read quality assessment
- Adapter removal and quality trimming

**Tools**
- FastQC  
- NanoPlot  
- Trimmomatic  
- Cutadapt  

📂 Folder: `Day1_qc_preprocessing/`

---

### **Day 2 — Genome Assembly & Assembly Quality Assessment**
**Goal:** Generate high-quality draft or complete genome assemblies.

**Assemblers**
- SPAdes / metaSPAdes
- MEGAHIT
- Shovill (Illumina wrapper)
- Flye (long-read assemblies)
- EPI2ME (ONT cloud workflows)

**Assembly Evaluation**
- QUAST (assembly statistics & comparison)
- N50, contig count, genome size, GC%

📂 Folder: `Day2_genome_assembly/`

---

### **Day 3 — Taxonomy, Phylogeny & Genome Similarity**
**Goal:** Place genomes in an evolutionary and taxonomic context.

**Analyses**
- Genome taxonomy assignment
- Phylogenomic tree construction
- Species and genus boundary testing

**Tools**
- GTDB-Tk
- iTOL (tree visualization)
- FastANI (ANI)
- CompareM (AAI)
- GGDC (digital DDH; web-based)

📂 Folder: `Day3_taxonomy_phylogeny/`

---

### **Day 4 — Genome Annotation & Functional Potential**
**Goal:** Identify genes, pathways, and metabolic capabilities.

**Annotation**
- Prokka (rapid genome annotation)
- Prodigal (gene prediction)
- InterProScan (protein domains)
- DRAM (metabolic & pathway-level annotation)

**Focus Areas**
- Core metabolic pathways


📂 Folder: `Day4_annotation_function/`

---

### **Day 5 — Comparative & Downstream Genomic Analyses**
**Goal:** Move from single genomes to comparative and ecological insights.

**Analyses**
- Core and pan-genome analysis
- Trait screening and specialization
- Secondary metabolite potential

**Tools**
- panX & Anvi’o
- antiSMASH (biosynthetic gene clusters)
- BiG-SCAPE (BGC clustering)
- Abricate 
- Trait-specific gene screening

📂 Folder: `Day5_comparative_genomics/`

---

## Additional Analyses (Optional / Advanced)
Depending on project goals, the following may also be included:

- Plasmid detection & characterization
- Genome circularization & topology validation

---

## Philosophy of This Repository
- **Reproducibility first** — every step scripted
- **No over-claiming** — conservative, reviewer-safe interpretations
- **Real data, real problems** — not toy examples
- **Designed for learning & reuse** — suitable for students and collaborators

---

## Blog Series
Each day in this repository corresponds to a detailed blog post in the **Daily Bioinformatics from Jojy’s Desk** series.

📘 Blog: https://jojyjohn28.github.io/blog/
💻 Website: https://jojyjohn28.github.io/

---

## Status
🚧 **Active and evolving project** started on Jan 07;2026

Folders, scripts, and documentation are updated continuously as analyses progress.

**Contributions, suggestions, and reuse are welcome.**

