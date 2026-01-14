#!/bin/bash

GENOME=$1
PREFIX=$(basename $GENOME .fasta)

# ARG screening
abricate --db card $GENOME > ${PREFIX}_card.tab
abricate --db resfinder $GENOME > ${PREFIX}_resfinder.tab
abricate --db argannot $GENOME > ${PREFIX}_argannot.tab

# Virulence screening
abricate --db vfdb $GENOME > ${PREFIX}_vfdb.tab

# Plasmid screening
abricate --db plasmidfinder $GENOME > ${PREFIX}_plasmids.tab

echo "Screening complete for $PREFIX"
