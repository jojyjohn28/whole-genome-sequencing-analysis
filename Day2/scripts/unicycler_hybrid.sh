#!/bin/bash
#SBATCH --job-name=unicycler_batch
#SBATCH --partition=bigmem
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=40
#SBATCH --mem=1500G
#SBATCH --time=72:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jojyj@clemson.edu
#SBATCH --output=unicycler_%j.out
#SBATCH --error=unicycler_%j.err

# ================================
# Load required modules
# ================================
module load spades/4.0.0
module load ncbi-blast+/2.16.0+

# Optional polishers (only needed if enabled in Unicycler)
export PATH=$PATH:/home/jojyj/racon/build/bin

# ================================
# Paths
# ================================
UNICYCLER="/home/jojyj/Unicycler/unicycler-runner.py"

input_file="/project/jonccal/ecocoat/hybrid_assembly/sample_details.txt"
base_output_dir="/project/jonccal/ecocoat/hybrid_assembly/unicycler"

mkdir -p "$base_output_dir"

# ================================
# Run Unicycler in batch
# ================================
while read -r sample_id illumina_r1 illumina_r2 nanopore; do

    echo "▶ Starting sample: $sample_id"
    echo "  Illumina R1: $illumina_r1"
    echo "  Illumina R2: $illumina_r2"
    echo "  Nanopore:   $nanopore"

    output_dir="${base_output_dir}/${sample_id}"
    mkdir -p "$output_dir"

    python "$UNICYCLER" \
        -1 "$illumina_r1" \
        -2 "$illumina_r2" \
        -l "$nanopore" \
        -o "$output_dir" \
        --threads 40

    echo "✅ Sample $sample_id completed at $(date)"
    echo "----------------------------------------"

done < "$input_file"

echo "🎉 All hybrid assemblies completed at $(date)"

