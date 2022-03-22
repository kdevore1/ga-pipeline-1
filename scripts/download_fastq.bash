cd data/untrimmed_fastq

if [ ! -f SRR2589044_1.fastq.gz ]; then 
  curl -O ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR258/004/SRR2589044/SRR2589044_1.fastq.gz
fi

if [ ! -f SRR2589044_2.fastq.gz ]; then
  curl -O ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR258/004/SRR2589044/SRR2589044_2.fastq.gz
fi

if [ ! -f SRR2584863_1.fastq.gz ]; then
  curl -O ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR258/003/SRR2584863/SRR2584863_1.fastq.gz
fi

if [ ! -f SRR2584863_2.fastq.gz ]; then
  curl -O ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR258/003/SRR2584863/SRR2584863_2.fastq.gz
fi

if [ ! -f SRR2584866_1.fastq.gz ]; then
  curl -O ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR258/006/SRR2584866/SRR2584866_1.fastq.gz
fi

if [ ! -f SRR2584866_2.fastq.gz ]; then
  curl -O ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR258/006/SRR2584866/SRR2584866_2.fastq.gz
fi

md5sum -c < CHECKSUMS.MD5
