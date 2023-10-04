##Script for calculating calculating D statistic, fd, etc, Brevioleria and Napeogenes as examples
####!/bin/bash

#BSUB -J ABBA[1-19]
#BSUB -o logs/ABBA_%J.o
#BSUB -e logs/ABBA_%J.e
#BSUB -R "select[mem>10000] rusage[mem=10000] span[hosts=1]"
#BSUB -n 7
#BSUB -M 10000
#BSUB -q normal
TIG=$(sed -n -e ${LSB_JOBINDEX}p /lustre/scratch125/tol/teams/meier/analysis/sing_wei/combined_analyses/Brevioleria/tigs.txt)
GENO=/lustre/scratch125/tol/teams/meier/analysis/sing_wei/combined_analyses/Brevioleria/analysis3/genome_scan/geno/Brevioleria.TIG"${TIG}".geno.gz
OUT=/lustre/scratch125/tol/teams/meier/analysis/sing_wei/combined_analyses/Brevioleria/analysis3/genome_scan/ABBA

/software/team347/sl40/genomics_general/ABBABABAwindows.py -w 10000 -m 5 -s 10000 -g $GENO\
   -o $OUT/fd.ec_arz.arz_arz.subspp_nov.aelia.TIG"${TIG}".csv.gz \
   -f phased --minData 0.5 --writeFailedWindow \
   -P1 ec_arz CAM070886,CAM070885,CAM070649,CAM070647,CAM070884,CAM070883,CAM070882,CAM070887 \
   -P2 arz_arz mm17-045,mm17-046,LdeS11-2379 \
   -P3 spp_nov LdeS11-1972,LdeS11-734,LdeS11-1960,LdeS11-678,LdeS11-1962,LdeS11-1973,02-2108,09-146,LdeS11-1961 \
   -O aelia CAM070591,CAM070588
