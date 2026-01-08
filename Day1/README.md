# Day 1 — Raw Reads to Clean, Analysis-Ready Data

This folder contains **Day 1 of the Whole Genome Sequencing (WGS) analysis workflow**, focused on preparing raw Illumina and Nanopore reads for downstream genome assembly and analysis.

### Day 1 Objectives
- Verify raw sequencing file integrity
- Assess read quality
- Identify poor-quality or contaminated data
- Generate clean, trimmed FASTQ files

### Key Steps
- **FastQC** — initial quality assessment (Illumina)
- **NanoPlot** — read length and quality profiling (Nanopore)
- **Trimmomatic / Cutadapt** — adapter removal and quality trimming
- **Post-QC validation** — confirm improvements after trimming

### Folder Structure
```text
Day1/
├── scripts/        # SLURM & bash scripts (FastQC, Trimmomatic, Cutadapt, NanoPlot)
├── results/        # QC reports and plots
└── README.md

**Notes**

• All scripts are HPC-ready and reproducible.

• This is an active workflow and will be updated as the project progresses.

• Both Illumina (short-read) and ONT (long-read) data are supported.

📘 Blog post (detailed walkthrough):