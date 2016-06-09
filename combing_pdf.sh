#!/bin/bash


roots=(
#Copy the content of file 'precurssor_name' here

mir156
mir159
mir160

)
 

############################################# predict miRNA secondary structure ##################

#bash batch_ps_2_pdf.sh

############################################# end #################################################

############################################# creating pdf containing all structure ###############


for x in ${roots[@]}; do
echo extracting file name ${x}

gs -o "$x"_footer.pdf -sDEVICE=pdfwrite -c "270 150 moveto /Times-Roman findfont 20 scalefont setfont ("$x"_ss.pdf) show"

#change "200 150" to change the location of label
done


for x in ${roots[@]}; do
echo combining file name with original file ${x}

pdftk "$x"_ss.pdf stamp "$x"_footer.pdf output pdf_with_file_name/"$x"_with_footer.pdf

done

for x in ${roots[@]}; do
echo combining all pdf files ${x}

gs -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=combinedpdf.pdf -dBATCH pdf_with_file_name/*_with_footer.pdf
done




############################################# end #################################################

############################################# removing file extention #############################

pdftk combinedpdf.pdf output uncompressed.pdf uncompress

sed -e "s/_ss.pdf//g" <uncompressed.pdf >final_mirna_structures.pdf


############################################# end #################################################

############################################# removing unwanted files #############################

rm *_footer.pdf #removing footer pdf
rm uncompressed.pdf
rm combinedpdf.pdf
mv *.ps ps/  #moving ps files
mv *_ss.pdf pdf/  #moving pdf files  

############################################# end #################################################



