# /bin/bash

# Copy backups to GCS from local

ndays=`date -d "3 day ago" '+%Y_%m_%d'`
yesterday=`date -d "1 day ago" '+%Y_%m_%d'`

echo '==================================================================='
echo "GS: Determining files to remove"

filelist=`gsutil ls gs://backup/*.bak`

for file in $filelist
do
    if [[ "$file" =~ .*"$ndays".* ]]; then
        gsutil rm $file
        echo "GS: Removed $file"
    fi
done

echo "Local: Get the filename for $yesterday"
filename=`ls /backup/backup_$yesterday*.bak`
if [ -z ${filename} ]; then
    echo "File for $yesterday not found!!!"
else
    echo "File $filename found."
    echo "GS: Copying file $filename..."
    gsutil -h Content-Type:application/octet-stream cp -e $filename gs://backup/
fi
