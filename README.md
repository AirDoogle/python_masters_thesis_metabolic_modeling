# MSc Thesis Metabolic Modeling (Python)
Repository for Python and R scripts, along with results from my MSc thesis in Bioinformatics & Computational Biology (University College Cork, 2024). Featuring metabolic modeling, statistical analysis,  principal componenet analysis (PCA), k-means clustering, significance & multiple testing, reaction pathway analysis, aiming to uncover biological insights from gene and clinical datasets.

This project used Python (v3.12.4) and R (v4.3.1) to:
- Analyze and visualize datasets using key Python libraries such as ```numpy```, ```pandas```,```sklearn```, ```matplotlib``` and ```seaborn```.
- Generate metabolic models through MATLAB® COBRA Toolbox (v2.24.3), Gurobi Optimizer (v11.0.2), and COBRApy (v0.29.0) in Python.


The methods and scripts were adapted from works by Cabbia et al. (2020) and Valenbreder (2022). Below are the descriptions of the files used with links to relevant figures and tables used in the final report.

---

# Data
**nutritech_otherdata.xlsx**, Confidential Clinical Data courtesy of the NutriTech Study, Imperial College London, ID: [NCT01684917](https://clinicaltrials.gov/study/NCT01684917?term=NCT01684917&rank=1).

**GSE88794_RAW.tar**, Gene expression data courtesy of GEO, Accession number: [GSE88794](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE88794).

---

# Script files

## 1. Gene expression preprocessing

[gene_expression_processing_pipeline.R](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/01_gene_expression_preprocessing/gene_expression_processing_pipeline.R)

Preprocesses raw gene expression data to make it suitable for downstream analyses. This includes cleaning, normalizing, and annotating the data.
## 2. NutriTech clinical data analysis

[nutritech_data_analysis_boxplots.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/02_nutritech_data_analysis/nutritech_data_analysis_boxplots.ipynb)

Used ```Pandas```, ```Matplotlib``` and ```Seaborn``` to analyze the NutriTech clinical dataset. Generates statistical summaries and visualizations of the clinical data with bar charts, scatterplots, heatmaps and 3x10 matrices of boxplots.

[nutritech_data_analysis_table.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/02_nutritech_data_analysis/nutritech_data_analysis_table.ipynb)

Creates a table summarising key NutriTech clinical data points ([Table 1.](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/results/02_nutritech_data_analysis/table_1_nutritech_clinical_measurements_before_and_after_diet_intervention.csv)).

## 3. Principal component analysis (PCA) on gene expression dataset

[pca_code_total_gene_exp_data.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/03_pca_on_gene_expression_dataset/pca_code_total_gene_exp_data.ipynb)

Used ```sklearn```, ```Pandas```, ```Matplotlib``` and ```Seaborn``` to perform PCA on gene expression data, creating PCA plots, visualizing variance explained by each component, and detecting clustering patterns. Compare Gene expression at T0 vs T120, Before vs After Diet intervention, MMT vs OGTT ([Figure 1 in report](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/results/03_pca_on_gene_expression_dataset/figure_1_pca_results_comparison_of_participants_gene_expression_data_coloured_by_time_of_ogtt_and_intervention_status.png)).

## 04. HUGO convert gene symbol

[match_gene_symbol_hugo.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/04_hugo_convert_gene_symbol/match_gene_symbol_hugo.ipynb)

Performs string matching to convert gene expression values from gene symbols to HUGO identifiers, mapping them onto the Recon3 metabolic model.

## 05. Model building

[matlab_code_gimme.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/05_model_building/matlab_code_gimme.ipynb)

Utilizes the outputs from section 4 to construct context-specific models for individual participants. The file columns contain HUGO symbols followed by expression values. The code iterates over these indices for each model to apply the GIMME algorithm with ATP maintenance as the objective function and a threshold of 75%. 

## 06. Jaccard score

[jaccard_distance_heatmap_and_pca.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/06_jaccard_score/jaccard_distance_heatmap_and_pca.ipynb)

Calculates the Jaccard distance between pairs of context-specific models, then plots the Jaccard scores in a heatmap and uses PCA plots for visualization. ([Figure 2-5](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/tree/main/results/06_jaccard_score)).

## 07. Flux balance analysis (FBA)

[fba_pca_cosine_similarity_analysis_multiple_timepoints.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/07_fba_flux_balance_analysis/fba_pca_cosine_similarity_analysis_multiple_timepoints.ipynb)

Performs FBA and calculates cosine similarity across various timepoints, generating multiple plots to compare different timepoints, including scatter plots and heatmaps for comprehensive analysis. This allows for an in-depth comparison of metabolic activity across different conditions

[fba_results_and_pca_cosine_similarity_analysis.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/07_fba_flux_balance_analysis/fba_results_and_pca_cosine_similarity_analysis.ipynb)

This script performs FBA and flux correlation between the context-specific models from section 5. and visualizes results through PCA plots and scatter plot matrices. Each group of models is processed by the function ```load_library```, which returns ```reactions_matrix```, ```metabolite_matrix```, ```gene_matrix```, and ```flx_df``` (flux).

[pca_plots_with_nutritech_labels_and_participant_tracking.ipynb ](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/07_fba_flux_balance_analysis/pca_plots_with_nutritech_labels_and_participant_tracking.ipynb)

Calculates cosine similarity from the ```flx_df```  files and generates PCA plots that integrate participants' clinical data as color gradients and labels for tracking individual clustering across timepoints ([Figure S5.1-4](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/tree/main/results/07_fba_flux_balance_analysis)).

[pca_plots_with_log-scale_nutritech_labels_as_colour gradient.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/07_fba_flux_balance_analysis/pca_plots_with_log-scale_nutritech_labels_as_colour%20gradient.ipynb)

improves upon the previous file by using a log scale for the color gradient. Calculates cosine similarity from the ```flx_df``` files and makes PCA plots at all timepoints, including NutriTech clinical measurements as color gradients and participant labels ([Figure 6A](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/results/08_k-means_clustering/figure_6_pca_flux_distribution_correlations_t120_mmt_icam1_and_kmeans_clusters.png)).

## 08. K-means clustering

[specified_kmeans_clustering_and_ntdata_kruskall_wallis_significance_test.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/08_k-means_clustering/specified_kmeans_clustering_and_ntdata_kruskall_wallis_significance_test.ipynb)

Performs K-means clustering on the Cosine Similarity PCA with customizable inputs for principal components, cluster counts, and **single** NutriTech variables. A Kruskall-Wallis significance test was conducted to assess significant differences between clusters using specified NutriTech data. The script provides p-values, cluster plots, and participant cluster assignments ([Figure 6B](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/results/08_k-means_clustering/figure_6_pca_flux_distribution_correlations_t120_mmt_icam1_and_kmeans_clusters.png)).

[significance_analysis_of_kmeans_clusters_across_all_data_points.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/08_k-means_clustering/significance_analysis_of_kmeans_clusters_across_all_data_points.ipynb)

Performs K-means clustering on the Cosine Similarity PCA with customizable inputs for principal components, plots, cluster counts, and **multiple** NutriTech variables. A Kruskall-Wallis significance test was conducted to assess significant differences between clusters using specified NutriTech data. The script provides lists that show the clustering method, File ID, p-value, H-statistic, mean, median, clusters. One list contains all samples + data points and another with only significantly different clusters ([Table 2 & S2](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/tree/main/results/08_k-means_clustering)).

## 09. Pathway and reaction analysis

[pathway_and_reaction_analysis.ipynb](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/blob/main/code/09_pathway_and_reaction_analyses/pathway_and_reaction_analysis.ipynb)

Used ```numpy```, ```pandas```,```sklearn```, ```matplotlib``` and ```seaborn```. Combines section 8 code, identifies significant clusters, and subsequently finds significantly different reactions between them. Multiple testing methods can be specified (Bonferroni, Benjamini-Hochberg, Benjamini-Yekutiell), and plots are generated to visualize the reactions. Lists of reaction information are also provided ([Figure 7-9](https://github.com/AirDoogle/MSc_Thesis_Metabolic_Modeling/tree/main/results/09_pathway_and_reaction_analyses)).

---

**Figure 9.** Number of significantly different reactions per pathway following Benjamini-Hochberg correction in a comparison of the k-means clusters 1 vs 2 in PBMC context-specific metabolic models.
<div align="center">  
    Barchart of k-means cluster 1 vs cluster 2: Number of signicant reactions per pathway.
</div>

![detailed Figure 9](https://github.com/AirDoogle/python_masters_thesis_metabolic_modeling/blob/main/results/09_pathway_and_reaction_analyses/figure_9_detailed_mmt_t240_significant_reactions_per_pathway_kmeans_clusters_1_vs_2.png) 


