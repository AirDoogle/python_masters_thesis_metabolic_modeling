# MSc_Thesis_Metabolic_Modeling
Repository for Python and R scripts, along with results from my MSc thesis in Bioinformatics & Computational Biology (University College Cork, 2024). This project leverages data science methods for metabolic modeling, PCA, clustering and pathway analysis, aiming to uncover biological insights from transcriptomic and clinical datasets.

This project used Python (v3.12.4) and R (v4.3.1) to:
- Perform gene expression analysis and metabolic model construction.
- Conduct statistical evaluations and reaction/pathway analyses.
- Generate Metabolic models through MATLAB® COBRA Toolbox (v2.24.3), Gurobi Optimizer (v11.0.2), and COBRApy (v0.29.0) in Python.  

The methods and scripts were adapted from works by Cabbia et al. (2020) and Valenbreder (2022). Below are the file structures, key analyses, and outputs generated during this project.

---

# Data
**NutriTech_otherdata.xlsx**, Confidential Clinical Data courtesy of the NutriTech Study, Imperial College London, ID: [NCT01684917](https://clinicaltrials.gov/study/NCT01684917?term=NCT01684917&rank=1).

**GSE88794_RAW.tar**, Gene expression data courtesy of GEO, Accession number: [GSE88794](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE88794).

---

# Script files
[Github](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/01_gene_expression_preprocessing/gene_expression_processing_pipeline.R)
**Gene expression processing pipeline.R**: Preprocesses raw gene expression data to make it suitable for downstream analyses. This includes cleaning, normalizing, and transforming the raw data.

[Github](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/02_nutritech_data_analysis/nutritech_data_analysis_boxplots.ipynb)
**Nutritech_data_analysis+boxplots.ipynb**: Analyzes the clinical data, generates statistical summaries, and produces visual outputs (boxplots, Table 1 in report).


**PCA_code_total_gene_exp_data.ipynb**: Computes PCA components, visualizes variance explained by each component, and generates PCA plots of gene data.

**Match_GeneSymbol_HUGO.ipynb**: Maps gene expression values from raw gene symbols to HUGO gene identifiers, Performs string matching, filters expression data for relevant genes, and prepares data for Recon3 metabolic model integration.

**DW_matlab_code_GIMME.ipynb**: Builds individualized metabolic models using the GIMME algorithm and generates .mat model files for downstream analysis.

**Jaccard_distance_Heatmap_and_PCA.ipynb** Generates heatmaps and PCA plots to visualize Jaccard distance metrics.

**FBA_Cosine_Similarity_Analysis_MultipleTimepoints.ipynb**:  Performs FBA and calculates cosine similarity scores for comparison across various timepoints, visualises results with scatter plots and heatmaps.

**FBA and PCA Plots of Cosine Similarity.ipynb** Integrates FBA with PCA to explore clustering patterns in metabolic fluxes and visualizes results through PCA plots and matrices.

**PCA Plots with NutriTech Labels and Participant Tracking.ipynb** Integrate participants clinical data with Metabolic models as labels for PCA plots to visualize participant clustering across timepoints.

**Specified Kmeans Clustering and NTdata Kruskall Wallis Significance Test.ipynb**: Performs K-means clustering on the Cosine Similarity PCA with customizable inputs for principal components, cluster counts, and single NutriTech variables. A Kruskall Wallis significance test was conducted to assess significant differences between clusters using specified NutriTech data. The script provides p-values, cluster plots, and participant cluster assignments. (Figure 6B).

**Significance Analysis of Kmeans Clusters Across All Data Points.ipynb**: Performs K-means clustering on the Cosine Similarity PCA with customizable inputs for principal components, plots, cluster counts, and multiple NutriTech variables. A Kruskall Wallis significance test was conducted to assess significant differences between clusters using specified NutriTech data. Generates lists that show the clustering method, File ID, p-value, H-statistic, mean, median, clusters. One list contains all samples + data points and another with only significantly different clusters.

**Pathway and Reaction Analysis.ipynb**
Combines section 8 code, identifies significant clusters, and subsequently finds significantly different reactions between them. Multiple analysis methods can be specified, and plots are generated to visualize the reactions. Lists of reaction information are also provided. (Figure 7-9).



# File Structure

### 1. Gene Expression Files.
- Gene expression processing pipeline.R: Processes gene expression data to prepare it for further analysis. Input: GSE88794_RAW.tar Output: processed_expression_data.txt, intermediate_data.txt, gene_symbol_expression_data.txt


### 2. NutriTech Data Analysis
* Nutritech_data_analysis+boxplots.ipynb: Analyzes the NutriTech dataset and generates boxplots for visualizing clinical measurements. (Table 1 in report) Input: NutriTech_otherdata.xlsx

* Nutritech_data_analysis_Table.ipynb: Creates a table summarizing key NutriTech data points. Input: NutriTech_otherdata_AVG.xlsx

### 3. PCA on Gene Expression Data Set
* PCA code_Total Gene Exp data.ipynb: Performs PCA on the gene expression data to create PCA plots, analyze variance, and detect clustering patterns (e.g., T0 vs T120 comparisons) (Figure 1 in report). Input: processed_expression_data.txt
  
### 4.  Gene Expression to Recon Conversion
* Match_GeneSymbol_HUGO.ipynb: Converts gene expression values from gene symbols to HUGO identifiers to map them onto the Recon3 metabolic model. Input: gene_symbol_expression_data.txt, vmh_gene_convert.txt, recon3_genes.txt Output: combined_recon3_ID_expression_W5D2T0_W5D2T120.txt, filtered_expression_data_W5D3T0.txt, filtered_expression_data_W5D3T120.txt, filtered_expression_data_W5D3T240.txt

### 5. Building Models
* DW_matlab_code_GIMME.ipynb: Utilizes the outputs from section 4 to construct context-specific models for individual participants. The file columns contain HUGO symbols followed by expression values. The code iterates over these indices for each model to apply the GIMME algorithm with ATP maintenance as the objective function and a threshold of 75%. Input: Section 4 outputs Output: .mat files for each individual sample, organized into folders named based on their ID (W5D2T0, W5D2T120, W5D3T0, W5D3T120, W5D3T240). Each folder contains individual .mat files, representing context-specific models.

### 6. Distance Metrics
* Jaccard_distance_Heatmap_and_PCA.ipynb: Calculates the Jaccard distance between pairs of context-specific models, then plots the Jaccard scores in a heatmap and uses PCA plots for visualization. (Figure 2-5) Input: Section 5 outputs

### 7. Flux Balance Analysis (FBA), Cosine Similarity, and PCA Plot Analysis
* FBA_Cosine_Similarity_Analysis_MultipleTimepoints.ipynb: Performs FBA and calculates cosine similarity across various timepoints, generating multiple plots to compare different timepoints, including scatter plots and heatmaps for comprehensive analysis. This allows for an in-depth comparison of metabolic activity across different conditions. Input: Recon3D.mat, model groups from Section 5
* FBA and PCA Plots of Cosine Similarity.ipynb: This script performs FBA and flux correlation between the context-specific models from section 5. Each group of models (e.g., W5D2T0) is processed by the function load_library, which returns reactions_matrix, metabolite_matrix, gene_matrix, and flx_df. Scatter plot matrices for PCA visualization are generated too. Input: Recon3D.mat, model groups from Section 5 Output: For each group, the reactions_matrix and flx_df are saved: e.g., (flx_df_W5D2T0_.csv, rxns_W5D2T0_.csv)
* PCA Plots with NutriTech Labels and Participant Tracking.ipynb: Calculates cosine similarity from the flx_df files and makes PCA plots including NutriTech clinical measurements as color gradients and participant labels to track individual clustering across timepoints. Input: NutriTech clinical data, flx_df files for each group (e.g., flx_df_W5D2T0_.csv)
* PCA Plots with Log-Scale NutriTech Labels as Colour Gradient.ipynb: Improves upon the previous file by using a log scale for the color gradient. Calculates cosine similarity from the flx_df files and makes PCA plots at all timepoints, including NutriTech clinical measurements as color gradients and participant labels (Figure 6A). Input: NutriTech clinical data, flx_df files for each group (e.g., flx_df_W5D2T0_.csv)
### 8. Kmeans Clustering Analysis
* Specified Kmeans Clustering and NTdata Kruskall Wallis Significance Test.ipynb: Performs K-means clustering on the Cosine Similarity PCA with customizable inputs for principal components, cluster counts, and single NutriTech variables. A Kruskall Wallis significance test was conducted to assess significant differences between clusters using specified NutriTech data. The script provides p-values, cluster plots, and participant cluster assignments. (Figure 6B). Input: NutriTech_otherdata_AVG.xlsx, flx_df files for each group (e.g., flx_df_W5D2T0_.csv)
* Significance Analysis of Kmeans Clusters Across All Data Points.ipynb: Performs K-means clustering on the Cosine Similarity PCA with customizable inputs for principal components, plots, cluster counts, and multiple NutriTech variables. A Kruskall Wallis significance test was conducted to assess significant differences between clusters using specified NutriTech data. Generates lists that show the clustering method, File ID, p-value, H-statistic, mean, median, clusters. One list contains all samples + data points and another with only significantly different clusters. Input: NutriTech_otherdata_AVG.xlsx, flx_df files for each group (e.g., flx_df_W5D2T0_.csv) Output: pca_analysis_significant_results.csv, pca_analysis_results_multiple_files.csv
### 9. Pathway and Reaction Analyses
* Pathway and Reaction Analysis.ipynb: Combines section 8 code, identifies significant clusters, and subsequently finds significantly different reactions between them. Multiple analysis methods can be specified, and plots are generated to visualize the reactions. Lists of reaction information are also provided. (Figure 7-9) Input: Outputs from Section 8

## **Repository Structure**
```plaintext
MSc_Thesis_Metabolic_Modeling/
│
├── README.md                # Overview of the project
├── LICENSE                  # Licensing information
├── data/                    # Input datasets
│   ├── NutriTech_otherdata.xlsx
│   └── processed_expression_data.txt
├── code/                    # Analysis scripts
│   ├── Gene_expression_pipeline.R
│   ├── Nutritech_data_analysis.ipynb
│   ├── PCA_GeneExpression.ipynb
│   ├── Match_GeneSymbol_HUGO.ipynb
│   ├── GIMME_Model_Building.ipynb
│   ├── Jaccard_Distance_Analysis.ipynb
│   ├── FBA_CosineSimilarity_Analysis.ipynb
│   ├── KMeans_Clustering.ipynb
│   ├── Pathway_Reaction_Analysis.ipynb
│   └── helper_functions.py
├── results/                 # Results and visualizations
│   ├── PCA_Plots/
│   ├── Cluster_Results/
│   ├── FBA_Results/
│   ├── Pathway_Analysis/
│   └── Model_Outputs/
└── docs/                    # Supporting documents
    └── thesis_summary.pdf
```
