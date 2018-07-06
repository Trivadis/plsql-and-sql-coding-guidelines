#/bin/bash

function create_target_dir(){
    rm -Rf ${TARGET_DIR}
    mkdir -p ${TARGET_DIR}/docs
}

function copy_resources() {
    cp ${DATA_DIR}/mkdocs.yml ${TARGET_DIR}/mkdocs.yml
    cp -r ${DATA_DIR}/docs/images ${TARGET_DIR}/docs
    cp -r ${DATA_DIR}/docs/stylesheets ${TARGET_DIR}/docs/stylesheets
}

function write_file(){
    FILE=$1
    echo "" >> ${TARGET_DIR}/docs/index.md
    sed -e 's/..\/image/image/g' ${DATA_DIR}/docs/${FILE} | sed -e 's/&#10008;/X/g' >> ${TARGET_DIR}/docs/index.md
}

function write_text(){
    TEXT=$1
    echo "" >> ${TARGET_DIR}/docs/index.md
    echo "${TEXT}" >> ${TARGET_DIR}/docs/index.md
}

function write_guidelines(){
    DIR=$1
    FIRST_HEADER=$2
    for f in ${DATA_DIR}/docs/${DIR}/g-*.md
    do
        echo "" >> ${TARGET_DIR}/docs/index.md
        sed -e "s|# |${FIRST_HEADER} |g" $f >> ${TARGET_DIR}/docs/index.md
    done
}

function convert_to_pdf(){
    cd ${TARGET_DIR}
    mkdocs build
    cd site
    weasyprint index.html ${DATA_DIR}/plsql.pdf
}

DATA_DIR="$(cd "$(dirname "${0}")" && pwd)"
TARGET_DIR=${DATA_DIR}/work-pdf

create_target_dir
copy_resources
write_file "index.md"
write_file "1-introduction/introduction.md"
write_file "2-naming-conventions/naming-conventions.md"
write_file "3-coding-style/coding-style.md"
write_text "# Language Usage"
write_text "## General"
write_guidelines "4-language-usage/1-general" "###"
write_text "## Numeric Data Types"
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
write_text "## DML &amp; SQL"
write_text "### General"
write_guidelines "4-language-usage/3-dml-and-sql/1-general" "####"
write_file "5-complexity-analysis/complexity-analysis.md"
write_file "6-code-reviews/code-reviews.md"
write_file "7-tool-support/tool-support.md"
write_file "9-appendix/appendix.md"
#convert_to_pdf
