#!/bin/bash


echo "Running pre_data.py..."
ipython3 pre_data.py


echo "Running model_fitting_linear_logistic.R..."
Rscript model_fitting_linear_logistic.R


echo "Running model_fitting_gompertz.R..."
Rscript model_fitting_gompertz.R


echo "Running model_plot.R..."
Rscript model_plot.R

echo "All scripts have been executed."


# Move the generated PDF to the ../results directory
mv Rplots.pdf ../results/

#pdflatex output.tex
#bibtex reference
#pdflatex output.tex
#pdflatex output.tex
