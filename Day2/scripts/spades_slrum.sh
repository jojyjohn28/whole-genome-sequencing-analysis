#!/bin/bash

#SBATCH --job-name unicycler_batch
#SBATCH --nodes 1
#SBATCH --cpus-per-task 40
#SBATCH --gpus-per-node a100:1
#SBATCH --mem 1500gb
#SBATCH --time 72:00:00
#SBATCH --mail-type ALL
#SBATCH --output=unicycler_%j.out    # Standard output
#SBATCH --error=unicycler_%j.err     # Standard error


# Load necessary modules
module load spades/4.0.0
module load ncbi-blast+/2.16.0+
export PATH=$PATH:/home/jojyj/racon/build/bin

# Input file with sample details
input_file="/project/jonccal/ecocoat/hybrid_assemblysample_details.txt"

# Base output directory
base_output_dir="/project/jonccal/ecocoat/hybrid_assembly/unicycler"

# Read the sample details line by line
while IFS= read -r line; do
    # Extract sample name and paths
    sample_id=$(echo "$line" | awk '{print $1}')
    illumina_r1=$(echo "$line" | awk '{print $2}')
    illumina_r2=$(echo "$line" | awk '{print $3}')
    nanopore=$(echo "$line" | awk '{print $4}')
    output_dir="${base_output_dir}/${sample_id}"

    # Create output directory if it doesn't exist
    mkdir -p "$output_dir"

    # Run Unicycler for the sample
    /home/jojyj/Unicycler/unicycler-runner.py \
        -1 "$illumina_r1" \
        -2 "$illumina_r2" \
        -l "$nanopore" \
        -o "$output_dir" \
        --threads 16

    # Print completion message
    echo "Sample $sample_id has been completed at $(date). Output saved in $output_dir"

done < "$input_file"

