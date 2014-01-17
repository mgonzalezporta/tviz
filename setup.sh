#!/bin/bash

R CMD build Ipsum
R CMD check Ipsum_1.0.tar.gz
R CMD install Ipsum_1.0.tar.gz

rm Ipsum_1.0.tar.gz
# copy pdf