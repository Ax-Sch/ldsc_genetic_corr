#!/bin/bash

cat ../results/ldsc/rg/* | grep "Summary of Gene" -A2 | grep -v "Summary of" | grep -v "\--" | grep "p1" | head -n1 > data_extract.tsv 
cat ../results/ldsc/rg/* | grep "Summary of Gene" -A2 | grep -v "Summary of" | grep -v "\--" | grep -v "p1" >> data_extract.tsv


