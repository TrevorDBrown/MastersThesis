#
#   BuildThesis.ps1
#   (c)2024 Trevor D. Brown. All rights reserved.
#   Distributed under the MIT license.
#
#   Purpose: to generate a PDF copy of the Master's Thesis.
#
#   Note: This script is designed to be called from VSCode, as a task.
#

function Build-Thesis {
    # Build the Thesis PDF.
    cd $TEX_PATH

    # Bibliography processing.
    #Write-Host "Processing Bibliography..."
    biber "$($META_PATH)\\Thesis.bcf"
    #biber -quiet "$META_PATH\Thesis.bcf"

    # PDF processing.
    Write-Host "Building PDF..."
    #pdflatex -quiet -output-directory=$META_PATH Thesis.tex
    pdflatex -output-directory="$($META_PATH)" Thesis.tex

    cd $THESIS_ROOT
}

function Make-Glossaries {
    # Make the Glossaries
    cd $META_PATH
    Write-Host "Making Glossaries..."
    makeglossaries -q Thesis

    # Go back to the root directory.
    cd $THESIS_ROOT
}

function Execute-Main {

    # Set the root directory of the script.
    $THESIS_ROOT=$PWD
    $OUTPUT_PATH="$THESIS_ROOT\Output"
    $META_PATH="$OUTPUT_PATH\MetaTeX"
    $TEX_PATH="$THESIS_ROOT\Thesis"

    # Check if Output directory exists.
    if (Test-Path -Path $OUTPUT_PATH) {
        echo "Output directory exists."
    } else {
        mkdir $OUTPUT_PATH
        Write-Host "Output directory created."
    }

    # Check if MetaTeX and Output directories exist.
    if (Test-Path -Path $META_PATH) {
        Write-Host "MetaTeX directory exists."
    } else {
        mkdir $META_PATH
        Write-Host "MetaTeX directory created."
    }

    # Build the Thesis PDF (1st pass)
    Write-Host "First Pass:"
    Build-Thesis

    # Make the Glossaries
    Make-Glossaries

    # Build the Thesis PDF (2nd pass)
    Write-Host "Second Pass:"
    Build-Thesis

    # Rename the output to the submission filename.
    Write-Host "Moving PDF to Output directory..."
    Copy-Item "$($META_PATH)\Thesis.pdf" "$($OUTPUT_PATH)\Brown.800793873.seas.thesis.pdf"
}

Execute-Main
Write-Host "Done!"