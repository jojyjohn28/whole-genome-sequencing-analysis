#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   bash fastqc_loop.sh /path/to/fastq_dir /path/to/out_dir 16
#
# Assumes input files end with .fastq.gz (or .fq.gz)
# Adjust glob if needed.

IN_DIR="${1:-.}"
OUT_DIR="${2:-fastqc_reports}"
THREADS="${3:-8}"

mkdir -p "${OUT_DIR}"

echo "[$(date)] Running FastQC..."
echo "Input:  ${IN_DIR}"
echo "Output: ${OUT_DIR}"
echo "Threads:${THREADS}"

shopt -s nullglob
FILES=( "${IN_DIR}"/*.fastq.gz "${IN_DIR}"/*.fq.gz )
shopt -u nullglob

if [ ${#FILES[@]} -eq 0 ]; then
  echo "No .fastq.gz or .fq.gz files found in ${IN_DIR}" >&2
  exit 1
fi

fastqc -t "${THREADS}" -o "${OUT_DIR}" "${FILES[@]}"

echo "[$(date)] Done. Reports in: ${OUT_DIR}"

