#!/bin/bash

R CMD build tviz
R CMD check tviz_1.0.tar.gz
R CMD INSTALL tviz_1.0.tar.gz

rm tviz_1.0.tar.gz
cp tviz.Rcheck/tviz-manual.pdf .
