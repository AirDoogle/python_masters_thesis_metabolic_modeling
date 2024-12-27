# MSc_Thesis_Metabolic_Modeling
Repository for Python and R scripts, along with results from my MSc thesis in Bioinformatics & Computational Biology (University College Cork, 2024). This project leverages data science methods for metabolic modeling, PCA, clustering and pathway analysis, aiming to uncover biological insights from transcriptomic and clinical datasets.

This project used Python (v3.12.4) and R (v4.3.1) to:
- Perform gene expression analysis and metabolic model construction.
- Conduct statistical evaluations and reaction/pathway analyses.
- Generate Metabolic models through MATLAB® COBRA Toolbox (v2.24.3), Gurobi Optimizer (v11.0.2), and COBRApy (v0.29.0) in Python.  

The methods and scripts were adapted from works by Cabbia et al. (2020) and Valenbreder (2022). Below are the file structures, key analyses, and outputs generated during this project.

---

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

# Data
**NutriTech_otherdata.xlsx**, Confidential Clinical Data courtesy of the NutriTech Study, Imperial College London, ID: [NCT01684917](https://clinicaltrials.gov/study/NCT01684917?term=NCT01684917&rank=1).

**GSE88794_RAW.tar**, Gene expression data courtesy of GEO, Accession number: [GSE88794](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE88794).

# Script files
**Gene expression processing pipeline.R**: Preprocesses raw gene expression data to make it suitable for downstream analyses. This includes cleaning, normalizing, and transforming the raw data.

**Nutritech_data_analysis+boxplots.ipynb**: Analyzes the clinical data, generates statistical summaries, and produces visual outputs (boxplots, Table 1 in report).


**PCA_code_total_gene_exp_data.ipynb**: Computes PCA components, visualizes variance explained by each component, and generates PCA plots of gene data.

**Match_GeneSymbol_HUGO.ipynb**: Maps gene expression values from raw gene symbols to HUGO gene identifiers, Performs string matching, filters expression data for relevant genes, and prepares data for Recon3 metabolic model integration.

**DW_matlab_code_GIMME.ipynb**: Builds individualized metabolic models using the GIMME algorithm and generates .mat model files for downstream analysis.

**Jaccard_distance_Heatmap_and_PCA.ipynb** Generates heatmaps and PCA plots to visualize Jaccard distance metrics.

**FBA_Cosine_Similarity_Analysis_MultipleTimepoints.ipynb**: Conducts Flux Balance Analysis (FBA) and calculates cosine similarities between metabolic models at different timepoints, computes similarity scores, and visualizes results with scatter plots and heatmaps.

**FBA and PCA Plots of Cosine Similarity.ipynb** Integrates FBA with PCA to explore clustering patterns in metabolic fluxes.
Key Functions: Performs flux correlation analysis and visualizes results through PCA plots and matrices.

**PCA Plots with NutriTech Labels and Participant Tracking.ipynb** Integrate participants clinical data with Metabolic models as labels for PCA plots to visualize participant clustering.

**Specified Kmeans Clustering and NTdata Kruskall Wallis Significance Test.ipynb**
Purpose: Performs K-means clustering on metabolic models and tests cluster significance using the Kruskal-Wallis test.
Key Functions: Clusters PCA results and evaluates their significance with statistical tests.
Significance Analysis of Kmeans Clusters Across All Data Points.ipynb
Purpose: Extends clustering analysis to multiple datasets, identifying significant patterns across various experimental conditions.
Key Functions: Performs statistical analysis on multi-dataset clusters.

**Pathway and Reaction Analysis.ipynb**
Purpose: Investigates metabolic pathways and reactions associated with significant clusters, providing biological insights.
Key Functions: Identifies significant pathways, computes reaction activity, and generates visualization plots.

