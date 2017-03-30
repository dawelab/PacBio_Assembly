#!/bin/bash
cd /home/student/binf8940/s_150/2nd_data
export 
PATH=/usr/local/prokka/1.11/bin/:/usr/local/hmmer/2.3.2/bin/:/usr/local/rnammer/latest/:/usr/local/tbl2asn/01052015:/usr/local/signalp/4.1c/:/usr/local/parallel/20150822/bin:$PATH
time /usr/local/prokka/1.11/bin/prokka ./ecoli-auto/ecoli.contigs.fasta --outdir ecoli_prokka

