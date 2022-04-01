#!/bin/bash
 
# Wrapper Script for bwa mem
#   USAGE: bash bwamem.bash PATH/TO/INPUT_1.trim.fastq.gz PATH/TO/OUTPUT/DIR

#SBATCH -N 1  # number of nodes
#SBATCH -n 1  # number of "tasks" (default: allocates 1 core per task)
#SBATCH -t 0-04:00:00   # time in d-hh:mm:ss
#SBATCH -p serial       # partition 
#SBATCH -q normal       # QOS
#SBATCH -o slurm.%j.out # file to save job's STDOUT (%j = JobId)
#SBATCH -e slurm.%j.err # file to save job's STDERR (%j = JobId)
#SBATCH --mail-type=ALL # Send an e-mail when a job starts, stops, or fails
#SBATCH --mail-user=kdevore1@asu.edu # Mail-to address
#SBATCH --export=NONE   # Purge the job-submitting shell environment


# Load Modules
module purge
module add bwa/0.7.17
module add samtools/1.12.0

# Store script arguments as variables
infile="$1"
outdir="$2"
reference="data/ref_genome/ecoli_rel606.fasta"

# Create output directory if neccessary
mkdir -p "$outdir"

# Find the basename and input directory of our input file
base=$(basename "${infile}" _1.trim.fastq.gz)
indir=$(dirname "${infile}")

# Call bwa mem and create a bam file
bwa mem "$reference" -R "@RG\tID:${base}\tSM:${base}" \
  "${indir}/${base}_1.trim.fastq.gz" \
  "${indir}/${base}_2.trim.fastq.gz" |
  samtools view -bo "${outdir}/${base}.aligned.bam"
