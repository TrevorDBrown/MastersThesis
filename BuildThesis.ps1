# Set the root directory of the script.
$THESIS_ROOT=$PWD

# Build the Thesis PDF
cd ./Thesis/
biber "./../MetaTeX/Thesis.bcf"
pdflatex -output-directory="./../MetaTeX/" Thesis.tex

# Go back to the root directory.
cd $THESIS_ROOT