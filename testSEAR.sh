#!/bin/bash
#PBS -S /bin/bash
#PBS -N SEAR
#PBS -l nodes=1:ppn=8,walltime=24:00:00,mem=24GB
#PBS -M gmg302@nyu.edu
#PBS -m ea
#PBS -e localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.e${PBS_JOBID}
#PBS -o localhost:${PBS_O_WORKDIR}/${PBS_JOBNAME}.o${PBS_JOBID}

#file=$1

#Requirements

module load bioperl
module load perl
module load blast+
module load samtools
module load bwa
module load usearch/7.0.1090

#################################TROUBLESHOOTING################################
#Error in converting fastq to fasta format: check input fastq files
#USEARCH version?? - tried new version - NO CHANGE
#Quality Cutoff?? - lower to 10 - NO CHANGE
#Caveats: The input fastq file must have a common identifier (min. 5 characters) in the read header line in order for hash tables to work correctly
#Sorted and STILL no improvment
#Could it be ASCII format? #Set to 64 -- NOPE!

########################################################################### 
#################################SETUP SEAR################################
###########################################################################
#SEAR annotates antimicrobial resistance genes (ARGs) from short read, metagenomic datasets.
#Requires:
#USEARCH, BWA, Samtools, BLAST

#1. Set up the SEAR_bin by following the 2_README.md file 
#in ./SEAR_bin to install the required software and setup the correct executables in the SEAR_bin.

#2. Open commandline_SEAR.pl in an editor and input the SEAR SETTINGS for your system (giving complete path

#3. Check that the following required Perl modules are installed on your system: - Getopt::Long - Pod::Usage - Time::HiRes - File::Basename - File::Find - List::Util - LWP::Simple

#4. Give the SEAR_DATA directory and commandline_SEAR.pl program read, write and execute rights (use chmod).

###########################################################################
#################################RUN SEAR################################
###########################################################################
#To Execute: perl commandline_sear.pl -i reads1.fastq reads2.fq
#1. Set path to commandline_sear.pl and fastq files (can be compressed)

sear=/home/gmg302/SEAR_commandline_version

##########INPUT OPTIONS ###############
#FILTERED 
data=/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/filtered-data
#RAW 
raw=/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/unfiltered-data/gzip-compressed
#LMAT
lmat=/scratch/at120/shared/gabby-alan/2015-10-01_C8364ACXX-redo/lmat-directories
export sear=/home/gmg302/SEAR_commandline_version
#########################################

########### EXECUTE ####################

cd $sear

#2. execute

#FILTERED & SORTED
perl commandline_SEAR.pl -i $data/$file.filtered.sorted.r1.fastq $data/$file.filtered.sorted.r2.fastq -t 8 

#RAW 
#perl commandline_SEAR.pl -i $raw/$file.r1.fastq.gz $raw/$file.r2.fastq.gz -t 8
#TEST 
#perl commandline_SEAR.pl -i $lmat/$file.staph.r1.fastq $lmat/$file.staph.r2.fastq -qc 10 -t 8

exit 0;

