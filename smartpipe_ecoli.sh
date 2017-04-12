#!/bin/bash

# set up the base directory for your analysis
basedir1="/escratch4/s_150/s_150_Mar_30/Ecoli_out"
mkdir $basedir1

# set up the smrtanalysis environment
source /usr/local/smrtanalysis/2.2.0/current/etc/setup.sh

# create a file of filenames containing the locations of your h5 files
ls /escratch4/s_150/s_150_Mar_30/E01_1/Analysis_Results/*bas.h5 > $basedir1/Ecoli.fofn

# convert the file of h5 filenames into xml format
/usr/local/smrtanalysis/2.2.0/current/analysis/bin/fofnToSmrtpipeInput.py $basedir1/Ecoli.fofn > $basedir1/input.xml

# launch the smrtpipe using the RS_Resequencing_GENE8940 settings.xml file 
/usr/local/smrtanalysis/2.2.0/current/analysis/bin/smrtpipe.py -D TMP=$basedir1 -D NPROC=1 -D MAX_THREADS=1 --params=/escratch4/s_150/s_150_Mar_30/E01_1/settings.xml xml:$basedir1/input.xml --output=$basedir1

# clean up tmp files
rm -f $basedir/tmp*
