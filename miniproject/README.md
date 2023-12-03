# Project Name

Script to find the most suitable mathematical model for fitting empirical datasets.

## Directory Structure

- **code:** Contains all the project's code files.
  - `pre_data.py`: Used for data filtering and adding corresponding IDs.
  - `model_fitting_linear_logistic.R`: Robust implementation of linear and logistic model fitting using the minpack.lm package.
  - `model_fitting_gompertz.R`: Implementation of Gompertz model fitting using the minpack.lm package.
  - `model_plot.R`: Uses minpack.lm and ggplot2 packages for fitting and plotting, generating images with fitted lines for Logistic, Linear Regression (degree one), Polynomial Regression (degree two), and Polynomial Regression (degree three).
  - `output.tex`: Contains LaTeX code for the report.
  - `reference.bib`: Contains bibliographic references for the LaTeX report.

- **Data:** Contains the data needed for code execution.

- **results:** Contains the results after running the code. After running the entire project, there will be a PDF file named `Rplots.pdf` in the directory. Each image inside contains fitted lines for Logistic, Linear Regression (degree one), Polynomial Regression (degree two), and Polynomial Regression (degree three).

- **sandbox:** Contains LaTeX-compiled PDF files.

# Run the Entire Project
chmod +x run_MiniProject.sh
./run_MiniProject.sh




## Note

The provided shell script `run_MiniProject.sh` cannot directly run the tex file to generate a PDF report. Please refer to the PDF in the sandbox folder or transfer `output.tex` and `reference.bib` to Overleaf for PDF report compilation.


## Version Information

- **R:** 4.3.2
- **IPython3:** 7.31.1