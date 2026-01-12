#!/bin/bash
#SBATCH --job-name=gtdbtk_denovo
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=1500G
#SBATCH --time=72:00:00
#SBATCH --partition=bigmem
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jojyj@clemson.edu
#SBATCH --output=gtdbtk_denovo_%j.out
#SBATCH --error=gtdbtk_denovo_%j.err

set -euo pipefail

module purge
module load gtdbtk/2.2.6

# -------------------------
# Paths
# -------------------------
GENOME_DIR="/zfs/camplab/WGS_DARPA_Campbellab/working_jojy/contigs"
OUTBASE="/zfs/camplab/WGS_DARPA_Campbellab/working_jojy/gtdbtk_new"

DENOVO_DIR="${OUTBASE}/de_novo"
CUSTOM_TAX="${OUTBASE}/custom_taxonomy_wgs_darpa.csv"
ITOL_DIR="${DENOVO_DIR}/itol"

mkdir -p "$DENOVO_DIR" "$ITOL_DIR"

cd "$OUTBASE"

echo "GTDB-Tk de_novo_wf started at $(date)"
echo "Running on host: $(hostname)"

# -------------------------
# de novo phylogenomic tree
# -------------------------
gtdbtk de_novo_wf \
  --genome_dir "$GENOME_DIR" \
  --out_dir "$DENOVO_DIR" \
  --extension fa \
  --bacteria \
  --cpus ${SLURM_CPUS_PER_TASK} \
  --outgroup_taxon p__Chloroflexota \
  --skip_gtdb_refs \
  --custom_taxonomy_file "$CUSTOM_TAX"

# -------------------------
# Convert tree for iTOL
# -------------------------
gtdbtk convert_to_itol \
  --input_tree "$DENOVO_DIR/gtdbtk.bac120.decorated.tree" \
  --output_tree "$ITOL_DIR/WGS_DARPA_GTDBTK"

echo "GTDB-Tk de_novo workflow completed at $(date)"

