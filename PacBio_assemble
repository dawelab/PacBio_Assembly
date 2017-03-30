#run canu.sh to assemble PacBio Sequence data

#!/bin/bash

cd /home/student/binf8940/s_150/2nd_data

export PATH=/usr/local/canu/1.4/Linux-amd64/bin:/usr/local/java/jdk1.8.0_74/bin:${PATH}
export LD_LIBRARY_PATH=/usr/local/gcc/5.3.0/lib64:${LD_LIBRARY_PATH}
export JAVA_HOME=/usr/local/java/jdk1.8.0_74

canu -p ecoli -d ecoli-auto  genomeSize=4.8m  -pacbio-raw p6.25x.fastq  useGrid=false

#qsub -q rcc-30d -l mem_total=8g -pe thread 4 ./canu.sh
///

#must uppercase O 
wget -O ecolik12_reference "http://www.ebi.ac.uk/ena/data/view/U00096&display=fasta"
///

# run mummer.sh to evaluate the assemble
#!/bin/bash
cd /home/student/binf8940/s_150/2nd_data
time /usr/local/mummer/latest/mummer -mum -b -c ecolik12_reference ./ecoli-auto/ecoli.contigs.fasta > mummer.mus
#qsub -q rcc-30d ./mummer.sh
///

#run mummerplot.sh to view the plot
#!/bin/bash
cd /home/student/binf8940/s_150/2nd_data
time /usr/local/mummer/latest/mummerplot -postscript -p mummer mummer.mus
#qsub -q rcc-30d ./mummerplot.sh




