#!/bin/bash

OUTFILE=$1

cd /data

echo "# Appendix " > $OUTFILE
echo "" >> $OUTFILE

cat docs/_appendixdata/appendix_a.md.template >> $OUTFILE
cat docs/_appendixdata/appendix_b.md.template >> $OUTFILE

find docs/4-language-usage/ -name g-*.md | xargs head -n 4 -q | tools/run-in-container/genappendix_b_table.awk >> $OUTFILE
