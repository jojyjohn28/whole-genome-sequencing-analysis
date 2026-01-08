#!/bin/bash
#SBATCH --job-name=trimmomatic_day1
#SBATCH --partition=camplab
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=64G
#SBATCH --time=24:00:00
#SBATCH --output=trimmomatic_%j.out
#SBATCH --error=trimmomatic_%j.err

set -euo pipefail

# ---- Load module ----
module load trimmomatic/0.39

# ---- Paths ----
IN_DIR="/project/your_project/raw_fastq"
OUT_DIR="/project/your_project/qc/trimmomatic"
ADAPTERS="/opt/Trimmomatic-0.39/adapters/TruSeq3-PE.fa"
THREADS="${SLURM_CPUS_PER_TASK}"

mkdir -p "${OUT_DIR}"/{trimmed,unpaired,logs}

echo "[$(date)] Trimmomatic started"

shopt -s nullglob
for R1 in "${IN_DIR}"/*_R1.fastq.gz; do
    sample=$(basename "$R1" _R1.fastq.gz)
    R2="${IN_DIR}/${sample}_R2.fastq.gz"

    if [[ ! -f "$R2" ]]; then
        echo "[WARN] Missing R2 for ${sample}, skipping"
        continue
    fi

    echo "[$(date)] Processing ${sample}"

    trimmomatic PE \
      -threads "${THREADS}" \
      "$R1" "$R2" \
      "${OUT_DIR}/trimmed/${sample}_R1.trimmed.fastq.gz" \
      "${OUT_DIR}/unpaired/${sample}_R1.unpaired.fastq.gz" \
      "${OUT_DIR}/trimmed/${sample}_R2.trimmed.fastq.gz" \
      "${OUT_DIR}/unpaired/${sample}_R2.unpaired.fastq.gz" \
      ILLUMINACLIP:"${ADAPTERS}":2:30:10 \
      LEADING:3 \
      TRAILING:3 \
      SLIDINGWINDOW:4:15 \
      MINLEN:36 \
      2> "${OUT_DIR}/logs/${sample}.trimmomatic.log"

done
shopt -u nullglob

echo "[$(date)] Trimmomatic finished"

