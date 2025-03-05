# LDSC pipeline
Simple snakemake pipeline to run munge_sumstats and LD score regression, including the download of all necessary dependencies.

### Prerequisites
Install snakemake (tested with version 7). This step is described in e.g. https://github.com/Ax-Sch/PRScs_pipeline (do the following two steps: install conda, install snakemake via conda).

### Configuration
Add your own summary statistics to the file resources/traits.tsv. You can find some example records which you could modify. The columns are used as following:
trait_name -> name you would like to give the respective trait
ss_path -> path where your summary statistics are stored
snp -> rsid column name
a1_effect -> effect allele column name
a2_non_effect -> non effect allele column name
add_munge_args -> extra parameters for merge_sumstats
no_munge -> if this is set to 1, the munge step will be skipped


### Run
Now you should be ready to execute the scripts - run snakemake within the root folder of the repository:
```
snakemake -c1 --use-conda
# increase -c1 to e.g. -c4 to use more (here: 4) cores 
```
Heritabilities of individual traits and genetic correlations between all possible pairs of traits are calculated and stored in the results/ldsc/ folder. 

### Depiction
Genetic correlations can be plotted using the script in the notebooks/ folder. I.e. within this folder, first run the bash commands given in gather_genetic_correlations.sh, then run the R script display_genetic_correlation.R .

### Acknowledgment
The snakefile is based on the rules from https://github.com/psychiatric-genomics-consortium/mdd-wave3-meta/tree/main


