# /usr/bin/rscript

## Description:
## This script takes multiple reference genomes as input and outputs a table 
## that summaries basic sequences properties.
##  
## Author:
## Min Wang (min.wang@depi.vic.gov.au)
##
## Date Created:
## 13 August 2015
## 
## Date modified and reason: 
## 19    August 2015    Change v3 to fit pbs script
## 20-21 August 2015    Add #gene/chr
##
## Note:
## 1. Variables [species_names] and [species_folders] must be cooresponding 
##    order respectively.
## 2. Data format documentation:
##    - General Reference genome and annotation:
##    ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF_000001405.30_GRCh38.p4/README.txt
##    - NCBI GFF3 format specifications
##    ftp://ftp.ncbi.nih.gov/genomes/README_GFF3.txt
## 
## Execution: 
## Rscript <MODULE_NAME> 


# Load Libraries
# source("http://bioconductor.org/biocLite.R")
if (!require("Biostrings")) {biocLite("Biostrings")}
library(Biostrings)
if (!require("biomartr")) {biocLite("biomartr")}
library(biomartr)
if (!require("GenomicRanges")) {biocLite("GenomicRanges")}
library(GenomicRanges)
if (!require("rtracklayer")) {biocLite("rtracklayer")}
library(rtracklayer)
if (!require("VariantAnnotation")) {biocLite("VariantAnnotation")}
library(VariantAnnotation)


# Define paths
path_pre         <- "/group/visitors/Min/analysis/geno2pheno"
# Define path to reference genomes
# skip the following species because their reference genomes are all scaffolds, 
# which does not fit the purpose of this script.
# "Guinea pig" ("GCF_000151735.1_Cavpor3.0") 
# "Naked mole rat" ("GCF_000230445.1_HetGla_1.0") 
# "Dolphin" ("GCF_000151865.2_Ttru_1.4")
# "Tree shrew" ("GCA_000181375.1_ASM18137v1")
# "Ferret" ("GCF_000215625.1_MusPutFur1.0")
# "Tasmanian_Devil" ("GCF_000189315.1_Devil_ref_v7.0")
species_names    <- c("Human", "Macaque", "Vervet", "Marmoset", "Mouse", "Rat",
                      "Cow", "Pig", "Dog", "Cat", "Opossum", "Rabbit")
species_folders  <- c("GCF_000001405.30_GRCh38.p4", "GCF_000002255.3_Mmul_051212",
                      "GCF_000409795.2_Chlorocebus_sabeus_1.1", 
                      "GCF_000004665.1_Callithrix_jacchus-3.2", "GCF_000001635.24_GRCm38.p4",
                      "GCF_000001895.5_Rnor_6.0", 
                      "GCF_000003055.6_Bos_taurus_UMD_3.1.1", 
                      "GCF_000003025.5_Sscrofa10.2", 
                      "GCF_000002285.3_CanFam3.1", "GCF_000181335.2_Felis_catus_8.0", 
                      "GCF_000002295.2_MonDom5", "GCF_000003625.3_OryCun2.0")
path_ref_genomes <- paste(path_pre, "data/ref_genomes/ftp.ncbi.nlm.nih.gov/genomes/all",
                          sep="/")
path_species     <- paste(path_ref_genomes, species_folders, sep="/")
# Define path to analysis folders
path_analyse     <- paste(path_pre, "analyses/2015-08-13", sep="/")
path_bin         <- paste(path_analyse, "bin", sep="/")
path_run         <- paste(path_analyse, "run", sep="/")
path_out         <- paste(path_analyse, "out", sep="/")


# Get input reference genomes
files_ref_genomes      <- paste(path_species, "/", species_folders, "_genomic.fna.gz", sep="")
# Get input reference genome annotation
files_annotations      <- paste(path_species, "/", species_folders, "_genomic.gff.gz", sep="")


# Get reference genome version
get_ref_version <- function(path_chr_file_str){
    path_split       <- unlist(strsplit(path_chr_file_str, "/"))
    n_path_split     <- length(path_split)
    file_chr         <- path_split[n_path_split]
    file_chr_split   <- unlist(strsplit(file_chr, "_"))
    n_file_chr_split <- length(file_chr_split)
    version          <- paste(file_chr_split[1:2], collapse="_")
    species          <- paste(file_chr_split[3:(n_file_chr_split-1)], collapse="_")
    return(c(version, species))
}

# Read data from file
read_data_chr <- function(ref_genome_file) {
    chr <- readDNAStringSet(ref_genome_file)
    return(chr)
}

read_data_anno <- function(annotation_file) {
    gff <- import.gff(annotation_file)
    return(gff)
}


# Check if key word is present in a character vector
# a support function for get_chr_stats
check_kw_present <- function(kw, char_vec) {
    if (length(grep(kw, char_vec)) != 0) {
        return(0)
    } else {
        return(1)
    }
}

# Get statistics from chromosome data
get_chr_stats <- function(chr) {
    kw        <- substr(strsplit(names(chr), " ")[[1]][1], 1, 2) #kw: key words
    pa_chr    <- grep(kw, names(chr), value = TRUE) #pa_chr: primary assemblies chromosomes
    n_pa_chr  <- length(pa_chr)  #n_pa_chr: the number of chromosomes
    boo_x_chr <- check_kw_present(" X", pa_chr) #boo_x_chr: boolean if x chr presents; 0: TRUE; 1: FASLE
    boo_y_chr <- check_kw_present(" Y", pa_chr) #boo_y_chr: boolean if y chr presents
    boo_m_chr <- check_kw_present("mitochondrion", pa_chr) #boo_m_chr: boolean if mitochondrion presents
    w_pa_chr  <- width(chr[pa_chr,]) #w_pa_chr: width of each chromosome
    return(c(kw, n_pa_chr, boo_x_chr, boo_y_chr, boo_m_chr, w_pa_chr))
}


# Get the kinds of type available in annotation data
get_anno_types <- function(gff) {
    anno_types <- levels(gff$type)
    return(anno_types)
}

# Count the occurences of each unique value in a character vector
# a support function for count_n_type_per_chr
f6 = function(x) {
    return(data.table(x)[, .N, keyby = x])
}

# Count the number of records per type per chromosome in annotation data
count_n_type_per_chr <- function(gff, type, kw) {
    gff_type_seqnames_subset <- grep(kw, seqnames(gff[which(gff$type=="gene"), ]), value=TRUE)
    tabulate_seqname_n <- f6(gff_type_seqnames_subset)
    return(tabulate_seqname_n)
}


write_file <- function(species_name, result_vector, outfile, append) {
    nchr <- as.numeric(result_vector[1])
    write.table(paste(species_name, "reference genome", sep = " "), file=outfile, sep = "\n", 
                append = append, row.names = FALSE, col.names = FALSE, quote = FALSE)
    write.table(paste("Total number of chromosomes:", nchr, sep = " "), file=outfile, sep = "\n", 
                append = TRUE, row.names = FALSE, col.names = FALSE, quote = FALSE)
    if (result_vector[2] == 0) {
        write.table("X Chromosome presents: TRUE", file=outfile, sep = "\n", append = TRUE, 
                    row.names = FALSE, col.names = FALSE, quote = FALSE)
    } else {
        write.table("X Chromosome presents: FALSE", file=outfile, sep = "\n", append = TRUE, 
                    row.names = FALSE, col.names = FALSE, quote = FALSE)
    }
    if (result_vector[3] == 0) {
        write.table("Y Chromosome presents: TRUE", file=outfile, sep = "\n", append = TRUE, 
                    row.names = FALSE, col.names = FALSE, quote = FALSE)
    } else {
        write.table("Y Chromosome presents: FALSE", file=outfile, sep = "\n", append = TRUE, 
                    row.names = FALSE, col.names = FALSE, quote = FALSE)
    }
    for (i in seq(4, 3+nchr)) {
        write.table(paste("Chr", i-3, "length:", result_vector[i], sep = " "), file=outfile, 
                    sep = "\n", append = TRUE, row.names = FALSE, col.names = FALSE, quote = FALSE)
    }
    write.table(paste("Available annotations:", paste(result_vector[(nchr+4):length(result_vector)], 
                collapse=", "), sep = " "), file=outfile, sep = "\n", append = TRUE, row.names = FALSE, 
                col.names = FALSE, quote = FALSE)
    write.table("\n", file=outfile, sep = "\n", append = TRUE, row.names = FALSE, col.names = FALSE, 
                quote = FALSE)
}

result1species <- function(species_name, file_ref_chr, file_annotation, out_signal="output") {
    outfile_tmp <- paste(path_out, out_signal, sep="/")
    outfile     <- paste(outfile_tmp, species_name, "txt", sep = ".")
    write.table()
}

result <- function(sns, rgs, as, outfile=paste(path_out, "output", sep = "/")) {
    rv1 <- get_stats1ref(rgs[1], as[1])
    write_file(sns[1], rv1, paste(outfile, sns[1], "txt", sep = "."), FALSE)
    for (i in seq(2, length(sns))) {
        rv <- get_stats1ref(rgs[i], as[i])
        write_file(sns[i], rv, paste(outfile, sns[i], "txt", sep = "."), FALSE)
    }
}


result <- function() {
    ref_genomes      
    annotations      

}

# run
result()


