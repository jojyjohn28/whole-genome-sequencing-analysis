#!/bin/bash
#SBATCH --job-name=cutadapt
#SBATCH --partition=camplab
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=cutadapt_%j.out
#SBATCH --error=cutadapt_%j.err

module load cutadapt/4.9

INPUT_DIR=/path/to/raw_fastq
OUTDIR=cutadapt_trimmed

mkdir -p "$OUTDIR"

for R1 in "$INPUT_DIR"/*_R1.fastq.gz; do
    sample=$(basename "$R1" _R1.fastq.gz)
    R2="$INPUT_DIR/${sample}_R2.fastq.gz"

    cutadapt \
      -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
      -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
      -q 20,20 \
      -m 50 \
      -j 16 \
      -o "$OUTDIR/${sample}_R1.trim.fastq.gz" \
      -p "$OUTDIR/${sample}_R2.trim.fastq.gz" \
      "$R1" "$R2"
done

echo "✅ Cutadapt trimming completed"

