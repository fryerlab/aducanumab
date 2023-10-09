#!/bin/bash

# extract webs summaries
for sample in 705A_Adu_Male 734A_Adu_Male 823A_IgG_Male 851A_IgG_Male
do
	cd /aducanumab/count/$sample/outs
	cp web_summary.html ../../web_summaries/"$sample"_web_summary.html
done
