#!/bin/bash

export LC_ALL=C

if [ -f EToKi_prepare_L1_SE.fastq.gz ]
then
  EToKi.py assemble --pe EToKi_prepare_L1_R1.fastq.gz,EToKi_prepare_L1_R2.fastq.gz --se EToKi_prepare_L1_SE.fastq.gz -k 15,30,50,70,90 -p EToKi_spades
else
  EToKi.py assemble --pe EToKi_prepare_L1_R1.fastq.gz,EToKi_prepare_L1_R2.fastq.gz -k 15,30,50,70,90 -p EToKi_spades
fi

rm -r EToKi_spades
