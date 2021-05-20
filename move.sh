#!/bin/bash

# Move certain files for a month to a sub folder

while getopts "e:y:m:" option
do
    case "${option}"
    in
        e) EXT=${OPTARG};;
        m) MONTH=${OPTARG};;
        y) YEAR=${OPTARG};;
    esac
done

case "$MONTH" in
    Jan) MON="01" ;;
    Feb) MON="02" ;;
    Mar) MON="03" ;;
    Apr) MON="04" ;;
    May) MON="05" ;;
    Jun) MON="06" ;;
    Jul) MON="07" ;;
    Aug) MON="08" ;;
    Sep) MON="09" ;;
    Oct) MON="10" ;;
    Nov) MON="11" ;;
    Dec) MON="12" ;;
esac

ls -lrt *.$EXT | grep " $MONTH " | awk '{print $9}' | xargs -I{} mv {} $YEAR-$MON
