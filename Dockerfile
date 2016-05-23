FROM ubuntu:14.04.3
MAINTAINER Upendra Devisetty <upendra@cyverse.org>
LABEL Description "This Dockerfile is for tbl2asn for converting fasta to .sqn format"

RUN apt-get update 

# Dependencies
RUN apt-get install -y wget
                          
# Download and change permissions of tbl2asn software
RUN wget ftp://ftp.ncbi.nih.gov/toolbox/ncbi_tools/converters/by_program/tbl2asn/linux64.tbl2asn.gz
RUN gunzip linux64.tbl2asn.gz
RUN mv linux64.tbl2asn tbl2asn
RUN chmod a+x tbl2asn
RUN cp tbl2asn /usr/bin

# Specify entrypoint
ENTRYPOINT ["tbl2asn"]
CMD ["-h"]

# Build the image
# docker build -t"=ubuntu/tbl2asn" .
# Testing the image
# Without any arguments
# sudo docker run docker run ubuntu/tbl2asn -h
# With arguments
# sudo docker run --rm -v $(pwd):/working-dir -w /working-dir ubuntu/quast-4.0 contigs_1.fasta contigs_2.fasta -R reference.fasta.gz -O operons.txt -G genes.txt -o quast_test_out
# SV calling
# sudo docker run --rm -v $(pwd):/working-dir -w /working-dir ubuntu/quast-4.0 -o quast_test_output_sv -R reference.fasta.gz -O operons.gff -G genes.gff --gage  --gene-finding  --eukaryote  --glimmer  -1 reads1.fastq.gz -2 reads2.fastq.gz contigs_1.fasta contigs_2.fasta

