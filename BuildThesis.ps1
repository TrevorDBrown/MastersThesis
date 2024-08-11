function Build-Thesis {
    # Build the Thesis PDF.
    # Note: on first run, PDF has broken references. Re-run to fix.
    # TODO: figure out why this happens...
    cd ./Thesis/
    biber "./../MetaTeX/Thesis.bcf"
    pdflatex -output-directory="./../MetaTeX/" Thesis.tex
}

function Execute-Main {

    # Set the root directory of the script.
    $THESIS_ROOT=$PWD
    $OUTPUT_PATH="$THESIS_ROOT\Output"
    $META_PATH="$THESIS_ROOT\MetaTeX"

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

        # Build the Thesis PDF (will generate, but references are broken.)
        Build-Thesis

        # Go back to the root directory.
        cd $THESIS_ROOT
    }

    # Build the Thesis PDF
    Build-Thesis

    # Go back to the root directory.
    cd $THESIS_ROOT

    # Rename the output to the submission filename.
    Copy-Item "$META_PATH\Thesis.pdf" "$OUTPUT_PATH\Brown.800793873.seas.thesis.pdf"
}

Execute-Main
