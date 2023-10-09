#!/bin/bash
for sample in 705A_Adu_Male 734A_Adu_Male 823A_IgG_Male 851A_IgG_Male
do
	qsub count.sh $sample
done

