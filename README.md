# scCFIB
Clustering scRNAseq data via cross-view information fusion

# Quick start:
Download the datasets from the website as the paper described, and download the
code files in  this repository and import function in them. <br>

1.Preprocess datasets <br>
&nbsp;&nbsp;&nbsp;&nbsp;scCFIB takes the preprocessed dataset as input. Single cell data preprocessing can be executed with preprocess.py using the scanpy Python package. <br>
2.Graph building <br>
&nbsp;&nbsp;&nbsp;&nbsp;Compute the adjacency matrix using Construction_graph.py  while standardizing the processed data. <br>
3.Run scCFIB algorithm <br>
&nbsp;&nbsp;&nbsp;&nbsp;Run scCFIB algorithm with Run.m to obtain the final clustering result. <br>
# Requirements:
Python --- 3.9  scanpy --- 1.9.1  numpy --- 1.19.3 <br>
pandas --- 1.4.3  scipy --- 1.9.0  scikit-learn --- 1.1.1

# Datasets
The datasets and and accession numbers obtained from the [GEO website] (https://www.ncbi.nlm.nih.gov/geo/) :Biase(GSE57249), Chung(GSE75688), Sun.1/Sun.2/Sun.3(GSE128066), Brown.1(GSE137710), 
Well-paired-Seq_PBMC (GSE192708), Chen(GSE87544).
Mouse_bladder dataset originates from the Mouse Cell Atlas project [https://figshare.com/s/865e694ad06d5857db4b](https://figshare.com/s/865e694ad06d5857db4b). <br>

Darmanis and Buttener dataset can be downloaded from [https://github.com/BatzoglouLabSU/SIMLR/tree/SIMLR/data](https://github.com/BatzoglouLabSU/SIMLR/tree/SIMLR/data). <br>

10X_PBMC can be obtained at [https://github.com/ttgump/scDeepCluster/tree/master/scRNA-seq%20data](https://github.com/ttgump/scDeepCluster/tree/master/scRNA-seq%20data). <br>

PBMC can download form [https://support.10xgenomics.com/single-cell-gene-expression/datasets/1.1.0/pbmc6k](https://support.10xgenomics.com/single-cell-gene-expression/datasets/1.1.0/pbmc6k). <br>
