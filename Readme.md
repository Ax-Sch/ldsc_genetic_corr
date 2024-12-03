# LDSC pipeline

Simple snakemake pipeline to run munge_sumstats and LD score regression, including the download of all necessary dependencies.

Modify the file resources/traits.tsv and add your summary statistics. 

Run snakemake:
```
snakemake -c1 --use-conda
```

Then genetic correlations are calculated (see results folder), which can be plotted using the scripts in the notebooks folder. 

The snakefile is based on the rules from https://github.com/psychiatric-genomics-consortium/mdd-wave3-meta/tree/main

To Do:
Check pipeline,
Improve Documentation
