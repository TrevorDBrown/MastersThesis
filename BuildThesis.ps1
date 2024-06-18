# Set the root directory of the script.
$THESIS_ROOT=$PWD

# Build the Thesis PDF
cd ./Thesis/
biber "./../MetaTeX/Auxiliary/Thesis.bcf"
pdflatex -aux-directory="./../MetaTeX/Auxiliary/" -output-directory="./../MetaTeX/Output/" Thesis.tex

# Go back to the root directory.
cd $THESIS_ROOT