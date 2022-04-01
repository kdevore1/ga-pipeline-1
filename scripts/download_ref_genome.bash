# Setup variables
ref_dir=~/dc_workshop/ga-pipline-1/data/ref_genome
ref_file=$ref_dir/ecoli_rel606.fasta   
url="ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/017/985/GCA_000017985.1_ASM1798v1/GCA_000017985.1_ASM1798v1_genomic.fna.gz"

# Download and decompress file
mkdir -p $ref_dir
curl -L $url | gunzip > $ref_file

# Load Modules
module purge
module add bwa/0.7.17

# Index the reference
bwa index $ref_file
