# CMEECourseWork

## Author

Bowen Duan

## Overview

**This repository contains the content of the first term computing weeks** 

## Versions

R: 4.3.2

Python: 3.10.12



## Contact

bd623@imperial.ac.uk

# CMEE Coursework Groupwork Repository

## Group5: Bowen Duan, Chufan Wu, Hongyuan Guo, Robert Temea, Yi Yu

## List of scripts

1. **align_seqs_better.py** in week2/code
2. **align_seqs_fasta.py** in week2/code
3. **oaks_debugme_group.py** in week2/code
4. **get_TreeHeight.R** in week3/code
5. **get_TreeHeight.py** in week3/code
6. **run_get_TreeHeight.sh** in week3/code
7. **TAutoCorr.R** in week3/code
8. **FloridaAutoCorr.tex** in week3/code
9. **PP_Regress_loc.R** in week3/code

## Script Summary

1. align_seqs_better.py


    This code is used to analyze the matching between two DNA sequences by comparing their character sequences, finding the best matching starting position, and calculating the matching score. It then stores the best matching result along with its corresponding score in the **results** directory.

2. align_seqs_fasta.py


    This code performs sequence alignment between two DNA sequences loaded from FASTA files, identifying the best matching alignment and saving it along with its score in the **results** directory.

3. oaks_debugme_group.py

    This code processes a CSV file containing biological data, specifically focusing on identifying and extracting rows related to oak species, and then writes this filtered data to a new CSV file and save in the **results** directory.

4. get_TreeHeight.R

    This R script includes a TreeHeight function for calculating tree heights using trigonometry, based on tree distance and angle. It reads tree data from a CSV file, adds calculated heights to the dataframe, and saves it as a new CSV, named after the input file's basename.

5. get_TreeHeight.py

    Similar to the R version, this Python script features a TreeHeight function for computing tree heights from tree base distance and top angle. It loads data from a CSV into a pandas dataframe, appends height calculations, and exports it as a new CSV, using the input file's basename for naming.

6. run_get_TreeHeight.sh

    A shell script that executes both the R and Python scripts for tree height calculation. It processes an externally provided dataset, with both scripts producing a CSV file with calculated tree heights, saved in the **results** directory.

7. TAutoCorr.R

    This code begins by loading an RData file containing Key West annual mean temperature data and calculates the correlation coefficient between consecutive years of temperature data. It then performs a specified number of permutations of the temperature data, calculating the correlation coefficient for each permutation. Finally, the code computes an approximate p-value, creates visualizations of the original temperature data and the distribution of correlation coefficients after permutations, and prints the results.

8. FloridaAutoCorr.tex

    This document presents a permutation analysis to establish significant temperature correlations between successive years in Key West, Florida during the 20th century. It discusses the methodology used and reports the results, including a significant positive correlation between temperature and year.

9. PP_Regress_loc.R


    This code conducts linear regression analysis on data, converting units from milligrams to grams and saving the results to a CSV file in the **results** directory.





