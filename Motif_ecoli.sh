#!/bin/bash

# set up the base directory for your analysis
basedir="/escratch4/s_150/s_150_Mar_30/Modification_and_Motif_ecoli"
mkdir $basedir

# set up the smrtanalysis environment
source /usr/local/smrtanalysis/2.2.0/current/etc/setup.sh

# create a file of filenames containing the locations of your h5 files
ls /escratch4/s_150/s_150_Mar_30/E01_1/Analysis_Results/*bax.h5 > $basedir/Ecoli.fofn

# convert the file of h5 filenames into xml format
/usr/local/smrtanalysis/2.2.0/current/analysis/bin/fofnToSmrtpipeInput.py $basedir/Ecoli.fofn > $basedir/input.xml

# format the E. coli canu assembly as a new smrtanalysis reference genome (NB: ignore the SLF4J warnings)
referenceUploader -c -p /escratch4/s_150/s_150_Mar_30/Ecoli_out_new2/data -n ECOLI_CANU_POLISHED -f /escratch4/s_150/s_150_Mar_30/Ecoli_out_new2/data/consensus.fasta --saw='sawriter -welter -blt 8' --samIdx='samtools faidx'


# launch the smrtpipe using the RS_Resequencing_GENE8940 settings.xml file 
/usr/local/smrtanalysis/2.2.0/current/analysis/bin/smrtpipe.py -D TMP=$basedir -D NPROC=4 -D MAX_THREADS=4 --params=/escratch4/s_150/s_150_Mar_30/E01_1/settings_motif_ecoli.xml xml:$basedir/input.xml --output=$basedir

# clean up tmp files
rm -f $basedir/tmp*
