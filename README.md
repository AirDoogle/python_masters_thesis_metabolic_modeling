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

