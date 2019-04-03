#!/bin/bash

# Set your preferred LaTeX compiler
LaTeXCOMPILER="pdflatex"
exts="aux bbl blg brf idx ilg ind lof log lol lot out toc synctex.gz"

# Removes log-files
clean_up_logs () {
    rm -f "texput.log"
    for ext in $exts; do
         rm -f "$1.$ext"
    done
}

compile_tex_file () {
    printf "\e[1m\e[4m\e[48;2;7;48;60m\n\n" # Bold, underline, bg-color
    printf "Compiling '$1'"
    printf "\n\n\e[0m"                      # Text back to normal
    $LaTeXCOMPILER "$1"
    $LaTeXCOMPILER "$1"

    # Comment out if you would like to keep log-files
    clean_up_logs "${1%.tex}"
}

# Go to the folder of the subject, compile it
# and then go to root level again. Necessary to go
# to folder of subject because of the way pdflatex
# looks for files referenced in a .tex-file
for f in *; do
    if [ -d ${f} ]; then
        # Will not run if no directories are available
        cd "$f"
        texfile=`find . -type f -name "*.tex"`
        compile_tex_file $texfile
        cd ..
    fi
done
