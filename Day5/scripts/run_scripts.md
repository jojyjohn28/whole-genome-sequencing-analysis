# 🧬 Day 5 — Comparative Genomics Scripts

## Pangenome, AMR Screening, and Secondary Metabolite Analysis

This directory contains helper scripts used in **Day 5** of the _Whole Genome Sequencing (WGS)_ blog series.  
These scripts support **comparative genomic analyses** including pangenome construction, antimicrobial resistance (AMR) screening, virulence factor detection, and secondary metabolite potential assessment.

The workflow is designed to scale to **large genome collections (100+ genomes)**.

---

## 📂 Scripts Overview

```text
scripts/
├── abricate.sh              # Batch AMR and virulence screening using Abricate
├── antismash.sh             # Secondary metabolite BGC prediction with antiSMASH
├── prokka.pbs               # Genome annotation with Prokka (PBS/HPC format)
├── comp_screening.sh        # Comprehensive pathogen screening workflow
└── core_pan_from_list.py    # Generate pangenome from genome list
```

---

# 🚀 Typical Workflow Order

1️⃣ **Annotate genomes** (Prokka)  
2️⃣ **Screen for AMR and virulence** (Abricate)  
3️⃣ **Predict biosynthetic gene clusters** (antiSMASH)  
4️⃣ **Perform pangenome analysis** (PanX or Roary)  
5️⃣ **Integrate results** with taxonomy and phylogeny

---

# 🔍 Script Descriptions

## 1️⃣ prokka.pbs

PBS/Slurm job script for batch genome annotation using Prokka.

**Purpose:**  
Annotates bacterial genomes to generate GFF, GenBank, and protein FASTA files.

**Usage:**

```bash
qsub prokka.pbs
# or
sbatch prokka.pbs
```

**Inputs:**
● Genome FASTA files

**Outputs:**
● `.gbk` (GenBank format)
● `.gff` (annotation file)
● `.faa` (protein sequences)

---

## 2️⃣ abricate.sh

Batch screening for antimicrobial resistance genes (ARGs) and virulence factors using Abricate.

**Purpose:**  
Identifies AMR genes and virulence factors across multiple databases.

**Databases used:**
● **ARGs:** CARD, ResFinder, ARG-ANNOT
● **Virulence:** VFDB

**Usage:**

```bash
bash abricate.sh
```

**Expected structure:**

```bash
#!/bin/bash

# Screen all genomes for AMR genes (CARD)
for genome in genomes/*.fasta; do
  prefix=$(basename $genome .fasta)
  abricate --db card $genome > results/${prefix}_card.tab
  abricate --db resfinder $genome > results/${prefix}_resfinder.tab
  abricate --db argannot $genome > results/${prefix}_argannot.tab
done

# Screen for virulence factors (VFDB)
for genome in genomes/*.fasta; do
  prefix=$(basename $genome .fasta)
  abricate --db vfdb $genome > results/${prefix}_vfdb.tab
done

# Summarize results
abricate --summary results/*_card.tab > summary_card.tab
abricate --summary results/*_vfdb.tab > summary_vfdb.tab
```

**Outputs:**
● Individual screening results per genome
● Summary tables (`summary_card.tab`, `summary_vfdb.tab`)

---

## 3️⃣ comp_screening.sh

Comprehensive pathogen screening workflow combining multiple databases.

**Purpose:**  
Runs Abricate against all relevant databases (ARGs, virulence, plasmids) in one pipeline.

**Usage:**

```bash
bash comp_screening.sh genome.fasta output_prefix
```

**Expected workflow:**

```bash
#!/bin/bash

GENOME=$1
PREFIX=$2

# ARG screening
abricate --db card $GENOME > ${PREFIX}_card.tab
abricate --db resfinder $GENOME > ${PREFIX}_resfinder.tab
abricate --db argannot $GENOME > ${PREFIX}_argannot.tab

# Virulence screening
abricate --db vfdb $GENOME > ${PREFIX}_vfdb.tab

# Plasmid screening
abricate --db plasmidfinder $GENOME > ${PREFIX}_plasmids.tab

echo "Comprehensive screening completed for $PREFIX"
```

**Outputs:**
● Multi-database screening results for a single genome

---

## 4️⃣ antismash.sh

Predicts biosynthetic gene clusters (BGCs) for secondary metabolites using antiSMASH.

**Purpose:**  
Identifies potential antibiotic, toxin, and signaling molecule production pathways.

**Usage:**

```bash
bash antismash.sh genome.gbk output_dir
```

**Expected structure:**

```bash
#!/bin/bash

GENOME=$1
OUTDIR=$2

antismash $GENOME \
  --output-dir $OUTDIR \
  --genefinding-tool prodigal \
  --cpus 16

echo "antiSMASH analysis completed for $GENOME"
```

**Inputs:**
● Annotated genome (GenBank format from Prokka)

**Outputs:**
● HTML report with interactive BGC visualization
● GenBank files with annotated BGCs
● Predicted compound classes

---

## 5️⃣ core_pan_from_list.py

Generates core and pangenome gene sets from a list of annotated genomes.

**Purpose:**  
Constructs core genome (genes present in all genomes) and pangenome (all unique genes) for comparative analysis.

**Usage:**

```bash
python core_pan_from_list.py \
  --genome_list genomes.txt \
  --output pangenome_results/
```

**Inputs:**
● Text file listing genome paths (one per line)
● Annotated genomes (GFF or GenBank format)

**Outputs:**
● Core genome gene set
● Pangenome gene presence/absence matrix
● Summary statistics

**Typical workflow:**

```bash
# Create genome list
ls genomes/*.gbk > genome_list.txt

# Run pangenome analysis
python core_pan_from_list.py \
  --genome_list genome_list.txt \
  --output pangenome_out/
```

---

# 🧠 Downstream Use

Outputs from these scripts can be:

● **Integrated with phylogenomic trees** (Day 3)  
● **Combined with functional annotations** (Day 4)  
● **Visualized in iTOL** as:

- AMR gene heatmaps
- Virulence factor presence/absence
- BGC distribution across clades
- Core vs. accessory gene profiles

**This enables comparative functional and ecological genomics at scale.**

---

# 📊 Typical Analysis Pipeline

```bash
# Step 1: Annotate genomes
qsub prokka.pbs

# Step 2: Screen for AMR and virulence
bash abricate.sh

# Step 3: Predict secondary metabolites
for gbk in prokka_out/*/*.gbk; do
  bash antismash.sh $gbk antismash_out/$(basename $gbk .gbk)
done

# Step 4: Construct pangenome
python core_pan_from_list.py --genome_list genomes.txt --output pangenome/

# Step 5: Summarize and visualize
# Combine results with Day 3 phylogeny and Day 4 annotations
```

---

# 📌 Notes

● **Abricate databases** should be updated regularly:

```bash
  abricate --setupdb
```

● **antiSMASH** requires annotated genomes (GenBank format)

● **Pangenome analysis** scales best with high-quality, complete genomes

● All scripts assume genomes are organized in a consistent directory structure

● For HPC environments, modify PBS/Slurm headers as needed

---

# 📘 Related Blog Post

**Whole Genome Sequencing — Day 5: Comparative & Downstream Genomic Analyses**

For more details visit:  
**https://jojyjohn28.github.io/blog/wgs-day5-comparative-genomics/**

GitHub repository:  
**https://github.com/jojyjohn28/whole-genome-sequencing-analysis/tree/main/Day5**
