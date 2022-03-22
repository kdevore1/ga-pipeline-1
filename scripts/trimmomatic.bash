# Load module
module add trimmomatic/0.33

# Trim Jar
TRIM_BIN=java -jar /packages/7x/trimmomatic/0.33/trimmomatic.jar "$@"

# Create basename
base=$(basename ${infile} _1.fastq.gz)

# Run Trimmomatic
$TRIM_BIN PE ${base}_1.fastq.gz ${base}_2.fastq.gz \
  ${base}_1.trim.fastq.gz ${base}_1un.trim.fastq.gz \
  ${base}_2.trim.fastq.gz ${base}_2un.trim.fastq.gz \
  SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15

