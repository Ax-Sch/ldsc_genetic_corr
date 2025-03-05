# LDSC Pipeline
A simple Snakemake pipeline to run `munge_sumstats` and LD score regression, including the download of all necessary dependencies.

## Prerequisites
Install Snakemake (tested with version 7). This step is described in [this repository](https://github.com/Ax-Sch/PRScs_pipeline). Follow these two steps:
1. Install Conda
2. Install Snakemake via Conda

## Configuration
Add your own summary statistics to the file `resources/traits.tsv`. You can find some example records to modify. The columns are used as follows:

- **trait_name** → Name you would like to assign to the respective trait
- **ss_path** → Path where your summary statistics are stored
- **snp** → RSID column name
- **a1_effect** → Effect allele column name
- **a2_non_effect** → Non-effect allele column name
- **add_munge_args** → Extra parameters for `merge_sumstats`
- **no_munge** → If set to `1`, the munge step will be skipped

## Run
Once configured, execute Snakemake within the root folder of the repository:
```bash
snakemake -c1 --use-conda
# Increase -c1 to e.g. -c4 to use more (here: 4) cores
```
Heritabilities of individual traits and genetic correlations between all possible pairs of traits are calculated and stored in the `results/ldsc/` folder.

## Depiction
Genetic correlations can be visualized using the script in the `notebooks/` folder. To generate the plots:
1. Run the bash commands given in `gather_genetic_correlations.sh`
2. Run the R script `display_genetic_correlation.R`

## Acknowledgment
The Snakemake workflow is based on the rules from [this repository](https://github.com/psychiatric-genomics-consortium/mdd-wave3-meta/tree/main).


