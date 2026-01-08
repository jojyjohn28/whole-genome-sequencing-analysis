#!/bin/bash
#SBATCH --job-name=megahit
#SBATCH --partition=bigmem
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=1500G
#SBATCH --time=336:00:00
#SBATCH --output=megahit_%j.out
#SBATCH --error=megahit_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jojyj@clemson.edu

# ================================
# Load MEGAHIT module
# ================================
module load megahit/1.2.9

# ================================
# Move to working directory
# ================================
cd /zfs/camplab/Jojy/darpa_working/data || exit 1

# ================================
# Run MEGAHIT
# ================================
megahit \
  -1 /zfs/camplab/Jojy/darpa_working/data/body3R1.fastq.gz \
  -2 /zfs/camplab/Jojy/darpa_working/data/body3R2.fastq.gz \
  -t 32 \
  -o /zfs/camplab/Jojy/darpa_working/megahit/body3

echo "MEGAHIT assembly completed at $(date)"

