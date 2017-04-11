#!/bin/bash

# set up the base directory for your analysis
basedir="/escratch4/s_150/s_150_Mar_30/lambda_out"
mkdir $basedir

# set up the smrtanalysis environment
source /usr/local/smrtanalysis/2.2.0/current/etc/setup.sh

# create a file of filenames containing the locations of your h5 files
ls /escratch4/s_150/s_150_Mar_30/lambda/data/Analysis_Results/*bas.h5 > $basedir/lambda.fofn

# convert the file of h5 filenames into xml format
/usr/local/smrtanalysis/2.2.0/current/analysis/bin/fofnToSmrtpipeInput.py $basedir/lambda.fofn > $basedir/input.xml

# launch the smrtpipe using the RS_Resequencing_GENE8940 settings.xml file 
/usr/local/smrtanalysis/2.2.0/current/analysis/bin/smrtpipe.py -D TMP=$basedir -D NPROC=1 -D MAX_THREADS=1 --params=/escratch4/s_150/s_150_Mar_30/lambda/settings.xml xml:$basedir/input.xml --output=$basedir

# clean up tmp files
rm -f $basedir/tmp*
