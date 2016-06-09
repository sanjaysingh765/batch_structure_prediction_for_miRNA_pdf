#!/bin/bash

#predicting the precurssor structure

RNAfold <input  #change the hairpin sequences file name here

filelist=`(find . -name \*.ps)`

for i in $filelist; do
 

echo convert ps to pdf
ps2pdf $i 

echo extracting file name
cat input | grep "^>" | sed -e "s/>//g" >precurssor_name


done



