function Build-Thesis {
    # Build the Thesis PDF.
    cd $TEX_PATH

    # Bibliography processing.
    echo "Processing Bibliography..."
    biber -quiet "./../MetaTeX/Thesis.bcf"

    # PDF processing.
    echo "Building PDF..."
    pdflatex -quiet -output-directory="./../MetaTeX/" Thesis.tex

    cd $THESIS_ROOT
}

function Make-Glossaries {
    # Make the Glossaries
    cd $META_PATH
    echo "Making Glossaries..."
    makeglossaries -q Thesis

    # Go back to the root directory.
    cd $THESIS_ROOT
}

function Execute-Main {

    # Set the root directory of the script.
    $THESIS_ROOT=$PWD
    $OUTPUT_PATH="$THESIS_ROOT\Output"
    $META_PATH="$THESIS_ROOT\MetaTeX"
    $TEX_PATH="$THESIS_ROOT\Thesis"

    Write-Host "Output path is: $OUTPUT_PATH"
    Write-Host "Meta path is: $META_PATH"

    # Check if Output directory exists.
    if (Test-Path -Path $OUTPUT_PATH) {
        echo "Output directory exists."
    } else {
        mkdir "Output"
        echo "Output directory created."
    }

    # Check if MetaTeX and Output directories exist.
    if (Test-Path -Path $META_PATH) {
        echo "MetaTeX directory exists."
    } else {
        mkdir "MetaTeX"
        echo "MetaTeX directory created."
    }

    # Build the Thesis PDF (1st pass)
    Build-Thesis

    # Make the Glossaries
    Make-Glossaries

    # Build the Thesis PDF (2nd pass)
    Build-Thesis

    # Rename the output to the submission filename.
    echo "Moving PDF to Output directory..."
    Copy-Item "$META_PATH\Thesis.pdf" "$OUTPUT_PATH\Brown.800793873.seas.thesis.pdf"
}

Execute-Main
echo "Done!"