#!/bin/zsh

# Set the root directory of the script, and other associated paths.
PROJECT_ROOT=$PWD
OUTPUT_PATH=$PROJECT_ROOT/Output
META_PATH=$PROJECT_ROOT/MetaTeX
THESIS_PATH=$PROJECT_ROOT/Thesis

Build-Thesis() {
    cd $THESIS_PATH

    # Bibliography Processing
    echo "Processing Bibliography..."
    biber "./../MetaTeX/Thesis.bcf"

    # PDF Processing
    echo "Building PDF..."
    pdflatex -quiet -output-directory="./../MetaTeX/" Thesis.tex

    # Go back to the root directory.
    cd $PROJECT_ROOT
}

Make-Glossaries() {
    # Make the Glossaries
    cd $META_PATH
    echo "Making Glossaries..."
    makeglossaries -q Thesis

    # Go back to the root directory.
    cd $PROJECT_ROOT
}

# Check if Output directory exists.
if [ -d $OUTPUT_PATH ]; then
    echo "Output directory exists."
else
    mkdir "Output"
    echo "Output directory created."
fi

# Check if MetaTeX directory exists.
if [ -d $META_PATH ]; then
    echo "MetaTeX directory exists."
else
    mkdir "MetaTeX"
    echo "MetaTeX directory created."
fi

# Build the Thesis PDF (1st pass)
Build-Thesis

# Make the Glossaries
Make-Glossaries

# Build the Thesis PDF (2nd pass)
Build-Thesis

# Rename the output to the submission filename.
cp "$META_PATH/Thesis.pdf" "$OUTPUT_PATH/Brown.800793873.seas.thesis.pdf"