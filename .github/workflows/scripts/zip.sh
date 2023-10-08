mkdir temp_zip
cp -r dist/* temp_zip/
cp -r node_modules temp_zip/
cd temp_zip
zip -r ../dist.zip ./
cd ..
rm -rf temp_zip
