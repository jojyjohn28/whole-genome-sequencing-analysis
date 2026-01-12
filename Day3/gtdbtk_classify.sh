#!/bin/bash
#SBATCH --job-name=gtdbtk_classify
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=1500G
#SBATCH --time=72:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jojyj@clemson.edu
#SBATCH --output=unicycler_%j.out
#SBATCH --error=unicycler_%j.err

module purge
module add gtdbtk/2.2.6 or use conda activate

# -------------------------
# Paths (EDIT IF NEEDED)
# -------------------------
GENOME_DIR="/zfs/camplab/WGS_DARPA_Campbellab/working_jojy/contigs"
OUTBASE="/zfs/camplab/WGS_DARPA_Campbellab/working_jojy/gtdbtk_new"

IDENTIFY_DIR="${OUTBASE}/identify"
ALIGN_DIR="${OUTBASE}/align"
CLASSIFY_DIR="${OUTBASE}/classify"

mkdir -p "$IDENTIFY_DIR" "$ALIGN_DIR" "$CLASSIFY_DIR"

cd "$OUTBASE"

echo "GTDB-Tk started at $(date)"

# -------------------------
# 1. Identify marker genes
# -------------------------
gtdbtk identify \
  --genome_dir "$GENOME_DIR" \
  --out_dir "$IDENTIFY_DIR" \
  --extension fa \
  --cpus 32

# Optional: quick sanity check
if [[ -f "$IDENTIFY_DIR/gtdbtk.bac120.markers_summary.tsv" ]]; then
  head "$IDENTIFY_DIR/gtdbtk.bac120.markers_summary.tsv"
fi

# -------------------------
# 2. Align marker genes
# -------------------------
gtdbtk align \
  --identify_dir "$IDENTIFY_DIR" \
  --out_dir "$ALIGN_DIR" \
  --cpus 32

# -------------------------
# 3. Classify genomes
# -------------------------
gtdbtk classify \
  --genome_dir "$GENOME_DIR" \
  --align_dir "$ALIGN_DIR" \
  --out_dir "$CLASSIFY_DIR" \
  --extension fa \
  --cpus 32

echo "GTDB-Tk classify completed at $(date)"

