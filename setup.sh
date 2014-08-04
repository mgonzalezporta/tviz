#!/bin/bash

R CMD build tviz
R CMD check tviz_0.99.0.tar.gz
R CMD INSTALL tviz_0.99.0.tar.gz

rm tviz_0.99.0.tar.gz
cp tviz.Rcheck/tviz-manual.pdf .
