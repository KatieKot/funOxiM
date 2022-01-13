#!/usr/bin/sh
# This code takes FASTQ files (cleaned), mapped data and calculates expression using STRINGTIE. 
# Input data should be cleaned from adaptors and any contaminants using your favorite tool or 
# manufacturers recomendations. If you have less replicates/runs, you have to adjust second 
# loop parameters. 

# Used tools:
# hisat2
# samtools 
# stringtie
# This data set was cleaned using BBDUK (from BBTools) and following settings:
#  bbduk.sh ktrim=r k=23 mink=11 hdist=1 minlen=30 maxns=1 tpe tbo qtrim=r trimq=15
# And following reference for adaptor and poly(A) trimming. 
#>for_adapter:
#AGATCGGAAGAGCACACGTCTGAACTCCAGTCA
#>rev_adapter
#AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT
#>polyT
#TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT
#>polyA
#AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA


######################################################################################
# set you param here. 
NT=10    # number of threads
REF="path_to_ref_genome_fasta" 
GFF3="path_to_ref_genome_GFF"

path2HISAT="~/Programs/hisat2-2.2.0/hisat2"
path2STRINGTIE="stringtie"
wdir="./"
mkdir ${wdir}CLEAN_BAMS/ ${wdir}BAMS/ ${wdir}STRINGTIE
######################################################################################

# map data
for i in ./INPUTS/*_L004_R1_001_val_1.fq.gz
  do
    R1=${i}
    R2=INPUTS/$(basename $i _L004_R1_001_val_1.fq.gz)_L004_R2_001_val_2.fq.gz
    BAM=$(basename $i _L004_R1_001_val_1.fq.gz)BAM
    ${path2HISAT} -p ${NT} --seed 1987 --no-unal --no-mixed --no-discordant --rna-strandness FR --dta --new-summary -x ${REF} -1 ${R1} -2 ${R2} -S tmp.sam 2>&1 | tee BAMS/${BAM}.stat
    samtools sort -@ ${NT} -o BAMS/${BAM}.bam tmp.sam
    rm tmp.sam
  done

# merge and deduplicate
for i in 2 4 6 8; 
  do
    j=${i}
    BAM1="BAMS/30"${j}"_S30"${j}"BAM.bam"
    BAM2="BAMS/II_30"${j}"_S30"${j}"BAM.bam"
    j=$(expr ${i} + 1)
    BAM3="BAMS/30"${j}"_S30"${j}"BAM.bam"
    BAM4="BAMS/II_30"${j}"_S30"${j}"BAM.bam"
    BAM="CLEAN_BAMS/302"${j}".bam"  

    samtools cat -o tmp.bam ${BAM1} ${BAM2} ${BAM3} ${BAM4} 
    samtools sort -@ ${NT} -n -o namesort.bam tmp.bam    
    samtools fixmate -r -m namesort.bam fixmate.bam
    samtools sort -@ ${NT} -o positionsort.bam fixmate.bam
    samtools markdup -r -s -S positionsort.bam ${BAM}
    samtools index ${BAM}
    rm tmp.bam namesort.bam positionsort.bam fixmate.bam
  done 

# run stringtie
for i in ./CLEAN_BAMS/*.bam; 
do 
  DIR=$(basename $i .bam)
  mkdir -p STRINGTIE/${DIR}
  ${path2STRINGTIE} -B -e -A -l $(basename $i .bam) -p ${NT} -G ${GFF3} -o ./STRINGTIE/${DIR}"/${DIR}.gtf" ${i}
done

# From this point, data should be analyzed using R or other programs. 