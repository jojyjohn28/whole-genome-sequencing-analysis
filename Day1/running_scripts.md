#### Running QC & Preprocessing Scripts (Day 1)

This document describes how to run all quality control and preprocessing scripts used in **Day 1 of the Whole Genome Sequencing (WGS) analysis workflow**.

All scripts are designed to work on a Linux system and are **HPC/SLURM-ready**, but most can also be adapted for local execution.

---

## 📁 Available Scripts

````text
scripts/
├── fastqc_loop.sh
├── fastqc-slurum.sh
├── fastqc_to_table.py
├── trimmomatic-slurum.sh
├── cutadapt-slurum.sh
└── nanoplot-slurum.sh


## 🧪 1. FastQC — Local Loop (Small Datasets)
Script

fastqc_loop.sh

Purpose

Runs FastQC on all FASTQ files in a directory using a simple Bash loop.
Recommended for testing, small datasets, or login-node usage.

```bash
bash fastqc_loop.sh <input_fastq_dir> <output_dir>
````

Example

```bash
bash fastqc_loop.sh raw_fastq fastqc_results
```

## 🧪 2. FastQC — SLURM Batch Script (Large Datasets)

Script

fastqc-slurum.sh

Purpose

Runs FastQC on many samples in parallel using SLURM.
Recommended for 100+ genomes or metagenomes.

How to Run

Edit paths inside the script:
INPUT_DIR=/path/to/raw_fastq
OUTDIR=fastqc_results

Submit the job:

```bash
sbatch fastqc-slurum.sh
```

## ✂️ 3. All other — SLURM Batch Script (Illumina PE Reads)

Follow same instruction from 2.
