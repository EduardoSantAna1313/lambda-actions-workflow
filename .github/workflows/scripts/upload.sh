cd ..

printf "\n\n### Creating HASH ###\n\n"

HASH=$(md5sum $LAMBDA_NAME.zip | awk '{print $1}')
FILE_NAME="$LAMBDA_NAME-$HASH.zip"

echo $FILE_NAME

mv $LAMBDA_NAME.zip $FILE_NAME

printf "\n\n### Upload zip ###\n"

aws s3 cp $FILE_NAME s3://$BUCKET_NAME/
