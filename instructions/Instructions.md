---
output:
  html_document:
    theme: united
---



# Instructions

The original START app that allows users to upload their own data is hosted on the website: https://kcvi.shinyapps.io/START/ 

**The START app allows users to visualize RNA-seq data starting with count data.**

- *Explore* the app's features with the example data set pre-loaded by clicking on the tabs above.
- *Upload* your data in the "Input Data" tab.

Code can be found on github: https://github.com/jminnier/STARTapp

Please post [issues on github](https://github.com/jminnier/STARTapp/issues/), and feel free to contribute by forking and submitting development branches.


# Visualizations

## Group Plots

<a name="pcaplots"></a>

### PCA Plot

This plot uses Principal Component Analysis (PCA) to calculate the principal components of the expression data using data from all genes. Euclidean distances between expression values are used. Samples are projected on the first two principal components (PCs) and the percent variance explained by those PCs are displayed along the x and y axes. Ideally your samples will cluster by group identifier.

 
### Sample Distance Heatmap

This plot displays unsupervised clustering of the Euclidean distances between samples using data from all genes. Again your data should cluster by group.
 

<a name="analysisplots"></a>

## Analysis Plots

These plots use the p-values and fold changes to visualize your data.

<a name="volcano"></a>

### Volcano Plot

This is a scatter plot log fold changes vs –log10(p-values) so that genes with the largest fold changes and smallest p-values are shown on the extreme top left and top right of the plot. Hover over points to see which gene is represented by each point.
 (<https://en.wikipedia.org/wiki/Volcano_plot_(statistics)>)

 

<a name="scatterplots"></a>

### Scatter Plot

This is a scatter plot of average gene expression in one group against another group. This allows the viewer to observe which genes have the largest differences between two groups. The smallest distances will be along the diagonal line, and points far away from the diagonal show the most differences. Hover over points to see which gene is represented by each point.

 
<a name="boxplots"></a>

## Gene Expression Boxplot

Use the search bar to look up genes in your data set. For selected gene(s) the stripchart (dotplot) and boxplots of the expression values are presented for each group. You may plot one or multiple genes along side each other. Hover over points for more information about the data.

<a name="heatmaps"></a>

## Heatmap

A heatmap of expression values are shown, with genes and samples arranged by unsupervised clustering. You may filter on test results as well as P-value cutoffs. By default the top 100 genes (with lowest P-values) are shown.

