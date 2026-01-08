#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --partition=camplab
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=04:00:00
#SBATCH --output=fastqc_%j.out
#SBATCH --error=fastqc_%j.err

module load fastqc/0.11.9

INPUT_DIR=/path/to/raw_fastq
OUTDIR=fastqc_results

mkdir -p "$OUTDIR"

fastqc -t 16 -o "$OUTDIR" "$INPUT_DIR"/*.fastq.gz

