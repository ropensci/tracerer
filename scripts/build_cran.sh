#!/bin/bash

mkdir build

cp -r ../R build
cp -r ../inst build
cp -r ../man build
cp -r ../src build
cp -r ../vignettes build
cp ../DESCRIPTION build
cp ../NAMESPACE build

cd build
R CMD build .
R CMD check --as-cran $(ls *.tar.gz)
