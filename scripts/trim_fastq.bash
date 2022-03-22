for infile in *_1.fastq.gz
do
 base=$(basename ${infile} _1.fastq.gz)
 bash trimmomatic.bash PE ${base}_1.fastq.gz ${base}_2.fastq.gz \
  ${base}_1.trim.fastq.gz ${base}_1un.trim.fastq.gz \
  ${base}_2.trim.fastq.gz ${base}_2un.trim.fastq.gz \
  SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15
done
