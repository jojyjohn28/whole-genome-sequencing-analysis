#!/bin/bash
#SBATCH --job-name=nanoplot
#SBATCH --partition=camplab
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=04:00:00
#SBATCH --output=nanoplot_%j.out
#SBATCH --error=nanoplot_%j.err

module load nanoplot

INPUT_FASTQ=/path/to/ont_reads.fastq.gz
OUTDIR=nanoplot_report

mkdir -p "$OUTDIR"

NanoPlot \
  --fastq "$INPUT_FASTQ" \
  --threads 16 \
  --loglength \
  --N50 \
  -o "$OUTDIR"

echo "✅ NanoPlot report generated"

