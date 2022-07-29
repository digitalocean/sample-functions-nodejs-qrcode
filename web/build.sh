#!/bin/bash

rm -rf dist/
mkdir dist; 
sed -e "s|%%FUNCTION_API_URL%%|${FUNCTION_API_URL}|" index.html > dist/index.html;

cp -R assets dist/