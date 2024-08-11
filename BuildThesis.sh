#!/bin/zsh

# Set the root directory of the script.
THESIS_ROOT=$PWD

# Check if Output directory exists.
if [ -d "$THESIS_ROOT/Output" ]; then
    echo "Output directory exists."
else
    mkdir "Output"
    echo "Output directory created."
fi

# Check if MetaTeX directory exists.
if [ -d "$THESIS_ROOT/MetaTeX" ]; then
    echo "MetaTeX directory exists."
else
    mkdir "MetaTeX"
    echo "MetaTeX directory created."

    # Build the Thesis PDF (will generate, but references are broken.)
    cd ./Thesis/
    biber "./../MetaTeX/Thesis.bcf"
    pdflatex -output-directory="./../MetaTeX/" Thesis.tex

    # Go back to the root directory.
    cd $THESIS_ROOT
fi

# Build the Thesis PDF (will generate with references)
cd ./Thesis/
biber "./../MetaTeX/Thesis.bcf"
pdflatex -output-directory="./../MetaTeX/" Thesis.tex

# Go back to the root directory.
cd $THESIS_ROOT

# Rename the output to the submission filename.
cp "./MetaTeX/Thesis.pdf" "./Output/Brown.800793873.seas.thesis.pdf"