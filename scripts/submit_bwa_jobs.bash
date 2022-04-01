#!/bin/bash

#SBATCH -N 1  # number of nodes
#SBATCH -n 1  # number of "tasks" (default: allocates 1 core per task)
#SBATCH -t 0-04:00:00   # time in d-hh:mm:ss
#SBATCH -p serial       # partition 
#SBATCH -q normal       # QOS
#SBATCH -o slurm.%j.out # file to save job's STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err # file to save job's STDERR (%j = JobId)
#SBATCH --mail-type=ALL # Send an e-mail when a job starts, stops, or fails
#SBATCH --mail-user=YOUR-EMAIL-ADDRESS # Mail-to address
#SBATCH --export=NONE   # Purge the job-submitting shell environment


# Variable Creation
metadata=~/dc_workshop/ga-pipeline-1/data/trimmed_fastq/data_urls.txt
indir=~/dc_workshop/ga-pipeline-1/data/trimmed_fastq
infiles=$(cut -d' ' -f 1 $metadata | grep _1.trim.fastq.gz)
outdir=~/dc_workshop/ga-pipeline-1/data/bam

# Create output directory if neccessary
mkdir -p "$outdir"

# Submit one job per input file (for loop)
for filename in $infiles; do
  sbatch ~/dc_workshop/ga-pipeline-1/scripts/bwamem.bash $indir/$filename $outdir
done
