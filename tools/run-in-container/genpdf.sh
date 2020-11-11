#!/bin/bash

function create_target_dir(){
    rm -Rf ${TARGET_DIR}
    mkdir -p ${TARGET_DIR}/docs
}

function copy_resources() {
    cp ${DATA_DIR}/mkdocs.yml ${TARGET_DIR}/mkdocs.yml
    cp -r ${DATA_DIR}/custom-theme ${TARGET_DIR}/custom-theme
    cp -r ${DATA_DIR}/docs/images ${TARGET_DIR}/docs
    cp -r ${DATA_DIR}/docs/stylesheets ${TARGET_DIR}/docs/stylesheets
}

# Materials for MkDocs 5.5.14 uses CSS that leads to wkhtmltopdf 0.12.6 printing all line numbers before the code with 
#   - "codehilite" plugin and "linenums: true"
#   - "pymdownx.highlight" plugin and "linenums_style: table" (default)
# The workaround is to use "pymdownx.highlight" with "linenums_style: pymdownx-inline" and some CSS fixes
# This is acceptable since the PDF is the secondary format and "pymdownx.highlight" is the newer plugin
# with some nice features for the HTML version.
function fix_mkdocs_yml() {
    mv ${TARGET_DIR}/mkdocs.yml ${TARGET_DIR}/mkdocs.ori.yml
    sed -e 's/linenums_style: table/linenums_style: pymdownx-inline/g' ${TARGET_DIR}/mkdocs.ori.yml > ${TARGET_DIR}/mkdocs.yml
}

function create_cover() {
    sed -e "s/#VERSION#/$(get_version)/g" ${DATA_DIR}/docs/cover-template.html \
        | sed -e "s/#YEAR#/$(date +'%Y')/g" > ${TARGET_DIR}/docs/cover.html
}

function write_file(){
    FILE=$1
    echo "" >> ${TARGET_DIR}/docs/index.md
    sed -e 's/..\/image/image/g' ${DATA_DIR}/docs/${FILE} | \
        sed -e 's|../../4-language-usage/2-variables-and-types/1-general/g-2150|#g-2150-avoid-comparisons-with-null-value-consider-using-is-not-null|g' | \
        sed -e 's|../../3-coding-style/coding-style/#rules|#rules|g' | \
        sed -e 's|PLSQL-and-SQL-Coding-Guidelines.pdf||g' | \
        sed -e 's/&#10008;/X/g' >> ${TARGET_DIR}/docs/index.md
}

function fix_footnote_links() {
    mv index.html index.ori.html
    sed -e 's/a class="footnote-ref"/a /g' index.ori.html > index.html
}

function write_text(){
    TEXT=$1
    echo "" >> ${TARGET_DIR}/docs/index.md
    echo "${TEXT}" >> ${TARGET_DIR}/docs/index.md
}

function write_guidelines(){
    DIR=$1
    HEADER=$2
    for f in ${DATA_DIR}/docs/${DIR}/*.md
    do
        echo "" >> ${TARGET_DIR}/docs/index.md
        sed -e "s|# |${HEADER} |g" $f | \
        sed -e 's|../../../../4-language-usage/3-dml-and-sql/3-transaction-control/g-3310|#g-3310-never-commit-within-a-cursor-loop|g' | \
        sed -e 's|../../../../4-language-usage/3-dml-and-sql/3-transaction-control/g-3320|#g-3320-try-to-move-transactions-within-a-non-cursor-loop-into-procedures|g' >> ${TARGET_DIR}/docs/index.md
    done
}

function get_version(){
    VERSION="$(grep guideline_version ${DATA_DIR}/mkdocs.yml | awk '{print $2}')"
    echo ${VERSION}
}

function convert_to_pdf(){
    cd ${TARGET_DIR}
    mkdocs build
    cd site
    fix_footnote_links
    wkhtmltopdf --enable-local-file-access \
                --allow "." \
                --disable-smart-shrinking \
                --javascript-delay 6000 \
                --outline-depth 6 \
                --outline \
                --print-media-type \
                --margin-top 10 \
                --margin-right 10 \
                --margin-bottom 20 \
                --margin-left 10 \
                --footer-spacing 10 \
                --footer-font-name "Roboto" \
                --footer-font-size 8 \
                --footer-left "PL/SQL & SQL Coding Guidelines Version $(get_version)" \
                --footer-right "Page [page] of [topage]" \
                --title "PL/SQL & SQL Coding Guidelines Version $(get_version)" \
                cover ../docs/cover.html \
                toc \
                --xsl-style-sheet stylesheets/toc.xsl \
                index.html ${DATA_DIR}/docs/9-appendix/PLSQL-and-SQL-Coding-Guidelines.pdf
}

DATA_DIR="$(cd "$(dirname "${0}")/../.." && pwd)"
TARGET_DIR=${DATA_DIR}/pdf

create_target_dir
copy_resources
fix_mkdocs_yml
create_cover
write_file "index.md"
write_file "1-introduction/introduction.md"
write_file "2-naming-conventions/naming-conventions.md"
write_file "3-coding-style/coding-style.md"
write_text "# Language Usage"
write_text "## General"
write_guidelines "4-language-usage/1-general" "###"
write_text "## Variables &amp; Types"
write_text "### General"
write_guidelines "4-language-usage/2-variables-and-types/1-general" "####"
write_text "### Numeric Data Types"
write_guidelines "4-language-usage/2-variables-and-types/2-numeric-data-types" "####"
write_text "### Character Data Types"
write_guidelines "4-language-usage/2-variables-and-types/3-character-data-types" "####"
write_text "### Boolean Data Types"
write_guidelines "4-language-usage/2-variables-and-types/4-boolean-data-types" "####"
write_text "### Large Objects"
write_guidelines "4-language-usage/2-variables-and-types/5-large-objects" "####"
write_text "### Cursor Variables"
write_guidelines "4-language-usage/2-variables-and-types/6-cursor-variables" "####"
write_text "## DML &amp; SQL"
write_text "### General"
write_guidelines "4-language-usage/3-dml-and-sql/1-general" "####"
write_text "### Bulk Operations"
write_guidelines "4-language-usage/3-dml-and-sql/2-bulk-operations" "####"
write_text "### Transaction Control"
write_guidelines "4-language-usage/3-dml-and-sql/3-transaction-control" "####"
write_text "## Control Structures"
write_text "### CURSOR"
write_guidelines "4-language-usage/4-control-structures/1-cursor" "####"
write_text "### CASE / IF / DECODE / NVL / NVL2 / COALESCE"
write_guidelines "4-language-usage/4-control-structures/2-case-if-decode-nvl-nvl2-coalesce" "####"
write_text "### Flow Control"
write_guidelines "4-language-usage/4-control-structures/3-flow-control" "####"
write_text "## Exception Handling"
write_guidelines "4-language-usage/5-exception-handling" "###"
write_text "## Dynamic SQL"
write_guidelines "4-language-usage/6-dynamic-sql" "###"
write_text "## Stored Objects"
write_text "### General"
write_guidelines "4-language-usage/7-stored-objects/1-general" "####"
write_text "### Packages"
write_guidelines "4-language-usage/7-stored-objects/2-packages" "####"
write_text "### Procedures"
write_guidelines "4-language-usage/7-stored-objects/3-procedures" "####"
write_text "### Functions"
write_guidelines "4-language-usage/7-stored-objects/4-functions" "####"
write_text "### Oracle Supplied Packages"
write_guidelines "4-language-usage/7-stored-objects/5-oracle-supplied-packages" "####"
write_guidelines "4-language-usage/7-stored-objects/6-object-types" "###"
write_text "### Triggers"
write_guidelines "4-language-usage/7-stored-objects/7-triggers" "####"
write_text "### Sequences"
write_guidelines "4-language-usage/7-stored-objects/8-sequences" "####"
write_text "## Patterns"
write_text "### Checking the Number of Rows"
write_guidelines "4-language-usage/8-patterns/1-checking-the-number-of-rows" "####"
write_text "### Access objects of foreign application schemas"
write_guidelines "4-language-usage/8-patterns/2-access-objects-of-foreign-application-schemas" "####"
write_text "### Validating input parameter size"
write_guidelines "4-language-usage/8-patterns/3-validating-input-parameter-size" "####"
write_text "### Ensure single execution at a time of a program unit"
write_guidelines "4-language-usage/8-patterns/4-ensure-single-execution-at-a-time-of-a-program-unit" "####"
write_text "### Use dbms_application_info package to follow progress of a process"
write_guidelines "4-language-usage/8-patterns/5-use-dbms-application-info-package-to-follow-progress-of-a-process" "####"
write_text "## Function Usage"
write_guidelines "4-language-usage/9-function-usage" "###"
write_file "5-complexity-analysis/complexity-analysis.md"
write_file "6-code-reviews/code-reviews.md"
write_file "7-tool-support/tool-support.md"
write_file "9-appendix/appendix.md"
convert_to_pdf
