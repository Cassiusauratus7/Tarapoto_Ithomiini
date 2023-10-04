####!/bin/bash
##Example of popgen script for Brevioleria subspecies, with 10kb windows

#BSUB -J parseVCF[1-19]
#BSUB -o logs/parseVCF_%J.o
#BSUB -e logs/parseVCF_%J.e
#BSUB -R "select[mem>10000] rusage[mem=10000] span[hosts=1]"
#BSUB -n 7
#BSUB -M 10000
#BSUB -q normal
GENO=${PATH_TO_GENO.GZ}
/software/team347/${USERNAME}/genomics_general/popgenWindows.py -g $GENO \
   -o popgen_clusters_Tarapoto/Brevioleria.TIG"${TIG}".Fst.Dxy.pi.csv.gz \
   -f phased -w 10000 -m 5000 -s 10000 \
   -p arz_arz mm17-045,mm17-046,LdeS11-2379\
   -p spp_nov LdeS11-1972,LdeS11-734,LdeS11-1960,LdeS11-678,LdeS11-1962,LdeS11-1973,02-2108,09-146,LdeS1
