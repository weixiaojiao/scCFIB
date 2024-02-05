# scCFIB
Clustering scRNAseq data via cross-view information fusion

# Quick start:
Download the datasets from the website as the paper described, and download the
code files in  this repository and import function in them. \<br>
1.Preprocess datasets
   scCFIB takes the preprocessed dataset as input. Single cell data preprocessing can be executed with preprocess.py using the scanpy Python package. \<br>
2.Graph building
   Compute the adjacency matrix using Construction_graph.py  while standardizing the processed data. \<br>
3.Run scCFIB algorithm
   Run scCFIB algorithm with Run.m to obtain the final clustering result. \<br>
# Requirements:
Python --- 3.9  scanpy --- 1.9.1  numpy --- 1.19.3 \<br>
pandas --- 1.4.3  scipy --- 1.9.0  scikit-learn --- 1.1.1
