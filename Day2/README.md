# Whole Genome Sequencing — Day 2

## Genome Assembly, Quality Assessment, and Topology

This folder contains all scripts, notes, and helper utilities used in **Day 2 of the Whole Genome Sequencing series**.

Day 2 focuses on transforming high-quality sequencing reads into genome assemblies and evaluating their quality, structure, and topology.

---

## 🔬 Topics Covered

- Short-read genome assembly (Illumina)
  - SPAdes
  - MEGAHIT
  - Shovill
- Long-read genome assembly (Nanopore / PacBio)
  - Flye
- Hybrid assembly
  - Unicycler (Illumina + ONT)
- Assembly quality assessment
  - QUAST
  - GC content visualization
- Genome topology and assembly graph inspection
  - Circular vs linear genomes
  - Bandage visualization

---

## 📂 Folder Structure

```text
Day2/
├── installation.md        # Conda-based installation instructions for all tools
├── running_scripts.md     # How to run each SLURM script (inputs, outputs, notes)
├── scripts/
│   ├── spades_slurm.sh          # Illumina short-read assembly (SPAdes)
│   ├── megahit_slurm.sh         # Fast short-read assembly (MEGAHIT)
│   ├── unicycler_hybrid.sh      # Hybrid assembly (Illumina + Nanopore)
│   ├── quast.sh                 # Assembly quality assessment
│   ├── quast_to_table.py        # Convert QUAST output to summary table
│   └── GC_vis.R                 # GC% visualization across assemblies
└── README.md


## 🧠 Key Takeaways

• No single assembler fits all datasets

• Assembly quality must always be evaluated

• GC content is a fast contamination check

• Long reads enable topology resolution

• Hybrid assembly often produces the best bacterial genomes

##📖 Related blog post
https://jojyjohn28.github.io/blog/wgs-day2-genome-assembly/
```
