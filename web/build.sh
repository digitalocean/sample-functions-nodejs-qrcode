#!/bin/bash

rm -rf dist/
mkdir dist; 
sed -e "s|%%FUNCTION_API_URL%%|${FUNCTION_API_URL}|" -e "s|%%PUBLIC_URL%%|${PUBLIC_URL}|" index.html > dist/index.html;

cp -R assets dist/