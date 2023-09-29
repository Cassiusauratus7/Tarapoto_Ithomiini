####!/bin/bash

#BSUB -J parseVCF[1-19]
#BSUB -o logs/parseVCF_%J.o
#BSUB -e logs/parseVCF_%J.e
#BSUB -R "select[mem>10000] rusage[mem=10000] span[hosts=1]"
#BSUB -n 7
#BSUB -M 10000
#BSUB -q normal
TIG=$(sed -n -e ${LSB_JOBINDEX}p /lustre/scratch125/tol/teams/meier/analysis/sing_wei/combined_analyses/Brevioleria/analysis3/tigs.txt)
VCF=/lustre/scratch125/tol/teams/meier/analysis/sing_wei/combined_analyses/Brevioleria/analysis3/filtered_bcftools/Brevioleria.filtered.TIG"${TIG}".vcf.gz
bcftools index -t $VCF
/software/team347/sl40/genomics_general/VCF_processing/parseVCFs.py -i $VCF --threads 10| \
bgzip > geno/Brevioleria.TIG"${TIG}".geno.gz
