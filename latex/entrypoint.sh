#!/bin/bash

export PLANTUML_JAR=/usr/share/java/plantuml/plantuml.jar
lualatex "-shell-escape" \
    -synctex=1 \
    -interaction=nonstopmode \
    -file-line-error \
    $1/$2
