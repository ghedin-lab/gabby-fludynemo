# gabby-fludynemo
Scripts for Gabby's analysis
Flu DyNeMo Nasopharynx Metatranscriptome

# Data filtering and preprocessing:
Contaminating human, ribosomal RNA, and adaptor sequences were removed from each dataset using DeconSeq, SortMeRNA, and Trimmomatic, respectively.  Quality was assessed using the FastQC Toolkit and sequences were masked for poor quality (Phred <10) using setqk (https://github.com/lh3/seqtk). 

# K-mer Taxonomic Classification
Interleaved fasta files containing high-quality, filtered 100 bp paired reads were used as input for taxonomic classification. Initial inspection of microbial community structure was performed using the k-mer based classification tool, Kraken, which is based on the NCBI  RefSeq sequence database. Community composition was further characterized using the k-mer taxonomy classifier, Livermore Metagenomics Analysis Toolkit (LMAT), which includes a large database of viral, bacterial, archaeal, plasmid, and chromosomal sequences in addition to the RefSeq database. Taxonomic assignments were visualized with the Krona interactive web tool. Individual reads were pulled based on the genus rank assigned by LMAT with custom bash scripts.  Influenza genomic sequences were removed with DeconSeq for downstream analyses. 

# de novo assembly and read mapping
To reduce the complexity of the metatranscriptome datasets, sequences assigned to known nasal genera (Streptococcus, Staphylococcus, Corynebacterium, Moraxella, Neisseria, Prevotella, Rothia, Veillonella, Haemophilus, and Dolosigranulum) were pooled and assembled into contigs using the parallel de novo assembler Ray with a k-mer length of 31.  Sequences not assigned to these groups were pooled and assembled using the same parameters.  Contigs from both the genera-based and non-genera-based assemblies were concatenated and quality filtered reads from individual samples were mapped to contigs using the Bowtie 2 alignment tool.  Mapped sequences in the SAM (Sequence Alignment/Map) format were sorted, indexed, and converted to binary format (BAM) using SAMtools.

# Functional annotation, pathway reconstruction, and analysis of differential expression 
Functional profiling was performed using the HMP Unified Metabolic Analysis Network 2 software (http://huttenhower.sph.harvard.edu/humann2). UniRef50 gene family assignments were mapped to KEGG (Kyoto Encyclopedia of Genes and Genomes) Orthogroups (KOs)  using custom HUManN2 python scripts for reconstruction of metabolic pathways.  Differential expression based on KO assignments was performed in the open-source statistical computing application RStudio (https://www.rstudio.com/) using the edgeR Bioconductor package.  Differentially expressed KOs were mapped to KEGG pathways and visualized in the iPath2 interactive web tool.

# Antibiotic resistance profiling
To profile the repertoire of actively expressed antibiotic resistance gene products, unassembled, quality filtered reads were queried against the Antibiotic Resistance Gene-ANNOTation (ARG-ANNOT) [50] custom database by nucleotide blast+ (version 2.2.31) with an E-value of 0.00001.  Expression of antimicrobial resistance genes was further assessed using the perl-based Search Engine for Antimicrobial Resistance (SEAR).  Relative expression of transcripts assigned to antimicrobial resistance genes was calculated and compared across groups in RStudio. 

