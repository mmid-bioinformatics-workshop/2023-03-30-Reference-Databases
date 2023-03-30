#!/bin/usr/env bash


# March 39, 2023 - Reference Databases workshop code


# 1. Move into the Reference_Databases directory and decompress the Datasets folder downloaded from the MMID Bioinformatics Github repository.

# make sure dataset name is the same as your downloaded Zip file
unzip Datasets-20230328T145901Z-001.zip


# 2. Move into the Downsampled_HR_fastq directory and decompress the host filtered fastq files.

cd ./Datasets/Downsampled_HR_fastq 
gunzip *.gz

## NOTE: If you are at the NML using high performance computer, use the following code
sbatch -c 1 --mem=2G -p NMLResearch -J unzip_file --wrap="gunzip *.gz"



# 3. Return to the REference_Databases directory

cd ../../

# 4. Make a new directory called kraken2_output

mkdir kraken2_output


# 5. Activate the conda environment containing the Kraken 2 package and review the contents of the environment to ensure the tool is installed.

conda activate conda_workshop
conda list


# 6. Review the Kraken 2 man page

kraken2 --help


# 7. Run Kraken 2 from the Reference_Databases directory using the test dataset SAMN02368311

kraken2 --db ./kraken2_STND-DB-8GB/ --threads 2 --report ./kraken2_output/SAMN02368311-K2reportfile.tsv --report-minimizer-data --paired ./Datasets/Downsampled_HR-fastq/SAMN02368311_R1.fastq ./Datasets/Downsampled_HR-fastq/SAMN02368311_R2.fastq > ./kraken2_output/SAMN02368311-K2readclassification.tsv

## NOTE: If you are at the NML using high performance computer, use the following code
sbatch -c 1 --mem=2G -p NMLResearch -J Kraken2 --wrap="kraken2 --db ./kraken2_STND-DB-8GB/ --threads 2 --report ./kraken2_output/SAMN02368311-K2reportfile.tsv --report-minimizer-data --paired ./Datasets/Downsampled_HR-fastq/SAMN02368311_R1.fastq ./Datasets/Downsampled_HR-fastq/SAMN02368311_R2.fastq > ./kraken2_output/SAMN02368311-K2readclassification.tsv"









