#!/bin/bash
#SBATCH --job-name=quast
#SBATCH --partition=bigmem
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
#SBATCH --mem=1000G
#SBATCH --time=168:00:00
#SBATCH --output=quast_%j.out
#SBATCH --error=quast_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jojyj@clemson.edu

# ================================
# Load QUAST module
# ================================
module load quast/5.0.2

# ================================
# Move to working directory (optional but recommended)
# ================================
# cd /path/to/assembly_dir || exit 1

# ================================
# Run QUAST
# ================================
quast.py \
  assembly1.fasta \
  -o quast_output \
  -t 24

echo "QUAST completed at $(date)"

