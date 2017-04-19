#!/bin/bash

# set up the base directory for your analysis
basedir1="/escratch4/s_150/s_150_Mar_30/Ecoli_out_new2"
mkdir $basedir1

# set up the smrtanalysis environment
source /usr/local/smrtanalysis/2.2.0/current/etc/setup.sh

# create a file of filenames containing the locations of your h5 files
ls /escratch4/s_150/s_150_Mar_30/E01_1/Analysis_Results/*bax.h5 > $basedir1/Ecoli.fofn

# convert the file of h5 filenames into xml format
/usr/local/smrtanalysis/2.2.0/current/analysis/bin/fofnToSmrtpipeInput.py $basedir1/Ecoli.fofn > $basedir1/input.xml

# format the E. coli canu assembly as a new smrtanalysis reference genome (NB: ignore the SLF4J warnings)
referenceUploader -c -p /home/student/binf8940/s_150/2nd_data/ecoli-auto/ -n ECOLI_CANU -f /home/student/binf8940/s_150/2nd_data/ecoli-auto/ecoli.unitigs.fasta --saw='sawriter -welter -blt 8' --samIdx='samtools faidx'


# launch the smrtpipe using the RS_Resequencing_GENE8940 settings.xml file 
/usr/local/smrtanalysis/2.2.0/current/analysis/bin/smrtpipe.py -D TMP=$basedir1 -D NPROC=1 -D MAX_THREADS=1 --params=/escratch4/s_150/s_150_Mar_30/E01_1/settings.xml xml:$basedir1/input.xml --output=$basedir1

# clean up tmp files
rm -f $basedir/tmp*




# edit reference stanza in settings.xml
# from 

#<param name="reference" hidden="true">
#   <value>common/references/lambda</value>
#</param>

# to

#<param name="reference" hidden="true">
#   <value>/home/student/binf8940/s_150/2nd_data/ecoli-auto/ECOLI_CANU</value>
#</param>
