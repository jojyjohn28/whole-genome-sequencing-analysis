
## Running Assembly & Evaluation Scripts (Day 2)

This folder contains batch scripts and helper utilities used in **Day 2 of the Whole Genome Sequencing series**, covering genome assembly, quality assessment, and visualization.

All scripts are designed for **HPC (SLURM-based)** execution unless noted otherwise.

---

## 📂 Script Overview

| Script | Purpose |
|------|--------|
| `spades_slurm.sh` | Short-read bacterial genome assembly using **SPAdes** |
| `megahit_slurm.sh` | Fast assembly for large datasets or exploratory runs using **MEGAHIT** |
| `unicycler_hybrid.sh` | **Hybrid assembly** (Illumina + Nanopore) using **Unicycler** |
| `quast.sh` | Assembly quality evaluation using **QUAST** |
| `quast_to_table.py` | Parse QUAST output into a **summary table (TSV)** |
| `GC_vis.R` | Visualize **GC content distributions** across assemblies |

---

## 🚀 Typical Execution Order

1️⃣ Assemble genomes  
→ `spades_slurm.sh` / `megahit_slurm.sh` / `unicycler_hybrid.sh`

2️⃣ Evaluate assemblies  
→ `quast.sh`

3️⃣ Summarize metrics  
→ `quast_to_table.py`

4️⃣ Visualize GC content  
→ `GC_vis.R`

---

## 🧬 Assembly Scripts

### SPAdes (Short-read isolates)
```bash
sbatch spades_slurm.sh

MEGAHIT (Large datasets / rapid runs)

sbatch megahit_slurm.sh

Unicycler (Hybrid Illumina + ONT)

sbatch unicycler_hybrid.sh
```

## 📊 Assembly Evaluation
QUAST
```bash
sbatch quast.sh
```
## Convert QUAST results to table

python quast_to_table.py

## 📈 GC Content Visualization (R)

Rscript GC_vis.R

## 📝 Notes

•Scripts assume modules or conda environments are available on the cluster.

•Paths and resource requests may need adjustment depending on the HPC system.

• These scripts are used throughout the Day 2 blog post and can be adapted for batch genome projects.

📌 See the Day 2 blog for detailed explanation of each step.
https://jojyjohn28.github.io/blog/wgs-day2-genome-assembly/