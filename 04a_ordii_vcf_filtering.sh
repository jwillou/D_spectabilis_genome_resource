#!/bin/bash
#
#   +-------------+
#   |  USE 1 CPU  |
#   +-------------+
#
#  Replace the USER name in this script with your username and
#  call your project whatever you want
#
#  This script must be made executable like this
#    chmod +x my_script
#
#  Submit this script to the queue with a command like this
#    run_script my_script.sh
#
#  My preferred setup before running:
#    -- script to be run in /home/scripts
#    -- project directory (of same name as script) in /home/
#    -- /input/ and /output/ subdirs within project dir

##  Set username
USER=aubaxh002

## Set project name
PROJ=psmc

## cd into working scratch directory
cd /scratch/${USER}_${PROJ}/


## --------------------------------
## Load modules 
module load bcftools/1.13


## --------------------------------
## Index, get stats on sample VCF files
cd variant_files/

# bgzip unfilt_d_ordii_Dgenome.vcf
# bcftools index unfilt_d_ordii_Dgenome.vcf.gz
# # bcftools stats unfilt_d_ordii_Dgenome.vcf.gz > unfilt_d_ordii_Dgenome.vcf.gz_STATS.txt
# 
# 
# ## --------------------------------
# ## Filter sample VCF files (merging before filtering results in loss of INFO details)
# module load vcftools/0.1.14
# module load samtools
# 
# vcftools --gzvcf unfilt_d_ordii_Dgenome.vcf.gz \
# --out filtered_d_ordii_Dgenome \
# --recode --recode-INFO-all \
# --remove-indels \
# --minQ 30 \
# --minDP 15
# 
# module purge
# module load bcftools/1.13
# 
# bgzip filtered_d_ordii_Dgenome.recode.vcf
# # bcftools stats filtered_d_ordii_Dgenome.recode.vcf.gz > filtered_d_ordii_STATS.txt
# 	
# ## limit to biallelic calls (should be redundant)
# bcftools view -M 2 \
# --output-type z \
# --output biallelic_filtered_d_ordii_Dgenome.recode.vcf.gz \
# filtered_d_ordii_Dgenome.recode.vcf.gz
# 
# # bcftools stats biallelic_filtered_d_ordii_Dgenome.recode.vcf.gz > \
# # biallelic_filtered_${i}_STATS.txt
# 
# bcftools index biallelic_filtered_d_ordii_Dgenome.recode.vcf.gz

## some additional filtering to get rid of probable sex-chromosomes, contigs with 
## high variation in read depth, and small contigs
# module purge
# module load vcftools/0.1.14
# 
# vcftools --gzvcf biallelic_filtered_d_ordii_Dgenome.recode.vcf.gz \
# --chr JAHHPX010000001.1 \
# --chr JAHHPX010000002.1 \
# --chr JAHHPX010000003.1 \
# --chr JAHHPX010000004.1 \
# --chr JAHHPX010000005.1 \
# --chr JAHHPX010000006.1 \
# --chr JAHHPX010000007.1 \
# --chr JAHHPX010000008.1 \
# --chr JAHHPX010000009.1 \
# --chr JAHHPX010000010.1 \
# --chr JAHHPX010000011.1 \
# --chr JAHHPX010000012.1 \
# --chr JAHHPX010000014.1 \
# --chr JAHHPX010000015.1 \
# --chr JAHHPX010000016.1 \
# --chr JAHHPX010000017.1 \
# --chr JAHHPX010000018.1 \
# --chr JAHHPX010000019.1 \
# --chr JAHHPX010000020.1 \
# --chr JAHHPX010000021.1 \
# --chr JAHHPX010000022.1 \
# --chr JAHHPX010000023.1 \
# --chr JAHHPX010000024.1 \
# --chr JAHHPX010000025.1 \
# --chr JAHHPX010000026.1 \
# --chr JAHHPX010000027.1 \
# --chr JAHHPX010000029.1 \
# --chr JAHHPX010000030.1 \
# --chr JAHHPX010000032.1 \
# --chr JAHHPX010000033.1 \
# --chr JAHHPX010000034.1 \
# --chr JAHHPX010000035.1 \
# --chr JAHHPX010000036.1 \
# --chr JAHHPX010000037.1 \
# --chr JAHHPX010000038.1 \
# --chr JAHHPX010000039.1 \
# --chr JAHHPX010000040.1 \
# --chr JAHHPX010000042.1 \
# --chr JAHHPX010000043.1 \
# --chr JAHHPX010000044.1 \
# --chr JAHHPX010000045.1 \
# --chr JAHHPX010000046.1 \
# --chr JAHHPX010000047.1 \
# --chr JAHHPX010000049.1 \
# --chr JAHHPX010000050.1 \
# --chr JAHHPX010000051.1 \
# --chr JAHHPX010000052.1 \
# --chr JAHHPX010000053.1 \
# --chr JAHHPX010000054.1 \
# --chr JAHHPX010000055.1 \
# --chr JAHHPX010000057.1 \
# --chr JAHHPX010000058.1 \
# --chr JAHHPX010000059.1 \
# --chr JAHHPX010000062.1 \
# --chr JAHHPX010000063.1 \
# --chr JAHHPX010000064.1 \
# --chr JAHHPX010000065.1 \
# --chr JAHHPX010000066.1 \
# --chr JAHHPX010000067.1 \
# --chr JAHHPX010000068.1 \
# --chr JAHHPX010000069.1 \
# --chr JAHHPX010000070.1 \
# --chr JAHHPX010000072.1 \
# --chr JAHHPX010000073.1 \
# --chr JAHHPX010000074.1 \
# --chr JAHHPX010000075.1 \
# --chr JAHHPX010000076.1 \
# --chr JAHHPX010000078.1 \
# --chr JAHHPX010000079.1 \
# --chr JAHHPX010000080.1 \
# --chr JAHHPX010000081.1 \
# --chr JAHHPX010000083.1 \
# --chr JAHHPX010000085.1 \
# --chr JAHHPX010000086.1 \
# --chr JAHHPX010000088.1 \
# --chr JAHHPX010000089.1 \
# --chr JAHHPX010000090.1 \
# --chr JAHHPX010000092.1 \
# --chr JAHHPX010000094.1 \
# --chr JAHHPX010000095.1 \
# --chr JAHHPX010000096.1 \
# --chr JAHHPX010000097.1 \
# --chr JAHHPX010000098.1 \
# --chr JAHHPX010000099.1 \
# --chr JAHHPX010000100.1 \
# --chr JAHHPX010000102.1 \
# --chr JAHHPX010000103.1 \
# --chr JAHHPX010000104.1 \
# --chr JAHHPX010000105.1 \
# --chr JAHHPX010000106.1 \
# --chr JAHHPX010000107.1 \
# --chr JAHHPX010000108.1 \
# --chr JAHHPX010000109.1 \
# --chr JAHHPX010000112.1 \
# --chr JAHHPX010000114.1 \
# --chr JAHHPX010000115.1 \
# --chr JAHHPX010000116.1 \
# --chr JAHHPX010000117.1 \
# --chr JAHHPX010000118.1 \
# --chr JAHHPX010000119.1 \
# --chr JAHHPX010000121.1 \
# --chr JAHHPX010000122.1 \
# --chr JAHHPX010000123.1 \
# --chr JAHHPX010000124.1 \
# --chr JAHHPX010000125.1 \
# --chr JAHHPX010000126.1 \
# --chr JAHHPX010000127.1 \
# --chr JAHHPX010000128.1 \
# --chr JAHHPX010000129.1 \
# --chr JAHHPX010000130.1 \
# --chr JAHHPX010000133.1 \
# --chr JAHHPX010000134.1 \
# --chr JAHHPX010000136.1 \
# --chr JAHHPX010000137.1 \
# --chr JAHHPX010000138.1 \
# --chr JAHHPX010000139.1 \
# --chr JAHHPX010000140.1 \
# --chr JAHHPX010000141.1 \
# --chr JAHHPX010000142.1 \
# --chr JAHHPX010000143.1 \
# --chr JAHHPX010000144.1 \
# --chr JAHHPX010000145.1 \
# --chr JAHHPX010000146.1 \
# --chr JAHHPX010000147.1 \
# --chr JAHHPX010000148.1 \
# --chr JAHHPX010000149.1 \
# --chr JAHHPX010000150.1 \
# --chr JAHHPX010000152.1 \
# --chr JAHHPX010000155.1 \
# --chr JAHHPX010000157.1 \
# --chr JAHHPX010000158.1 \
# --chr JAHHPX010000159.1 \
# --chr JAHHPX010000160.1 \
# --chr JAHHPX010000161.1 \
# --chr JAHHPX010000162.1 \
# --chr JAHHPX010000163.1 \
# --chr JAHHPX010000165.1 \
# --chr JAHHPX010000166.1 \
# --chr JAHHPX010000167.1 \
# --chr JAHHPX010000168.1 \
# --chr JAHHPX010000169.1 \
# --chr JAHHPX010000170.1 \
# --chr JAHHPX010000171.1 \
# --chr JAHHPX010000172.1 \
# --chr JAHHPX010000173.1 \
# --chr JAHHPX010000174.1 \
# --chr JAHHPX010000175.1 \
# --chr JAHHPX010000177.1 \
# --chr JAHHPX010000178.1 \
# --chr JAHHPX010000179.1 \
# --chr JAHHPX010000183.1 \
# --chr JAHHPX010000184.1 \
# --chr JAHHPX010000185.1 \
# --chr JAHHPX010000186.1 \
# --chr JAHHPX010000187.1 \
# --chr JAHHPX010000188.1 \
# --chr JAHHPX010000189.1 \
# --chr JAHHPX010000190.1 \
# --chr JAHHPX010000191.1 \
# --chr JAHHPX010000192.1 \
# --chr JAHHPX010000193.1 \
# --chr JAHHPX010000195.1 \
# --chr JAHHPX010000196.1 \
# --chr JAHHPX010000197.1 \
# --chr JAHHPX010000198.1 \
# --chr JAHHPX010000199.1 \
# --chr JAHHPX010000200.1 \
# --chr JAHHPX010000201.1 \
# --chr JAHHPX010000202.1 \
# --chr JAHHPX010000203.1 \
# --chr JAHHPX010000204.1 \
# --chr JAHHPX010000205.1 \
# --chr JAHHPX010000206.1 \
# --chr JAHHPX010000207.1 \
# --chr JAHHPX010000208.1 \
# --chr JAHHPX010000209.1 \
# --chr JAHHPX010000210.1 \
# --chr JAHHPX010000211.1 \
# --chr JAHHPX010000212.1 \
# --chr JAHHPX010000213.1 \
# --chr JAHHPX010000214.1 \
# --chr JAHHPX010000215.1 \
# --chr JAHHPX010000216.1 \
# --chr JAHHPX010000217.1 \
# --chr JAHHPX010000218.1 \
# --chr JAHHPX010000219.1 \
# --chr JAHHPX010000220.1 \
# --chr JAHHPX010000222.1 \
# --chr JAHHPX010000224.1 \
# --chr JAHHPX010000225.1 \
# --chr JAHHPX010000226.1 \
# --chr JAHHPX010000227.1 \
# --chr JAHHPX010000228.1 \
# --chr JAHHPX010000229.1 \
# --chr JAHHPX010000230.1 \
# --chr JAHHPX010000231.1 \
# --chr JAHHPX010000232.1 \
# --chr JAHHPX010000233.1 \
# --chr JAHHPX010000234.1 \
# --chr JAHHPX010000235.1 \
# --chr JAHHPX010000237.1 \
# --chr JAHHPX010000238.1 \
# --chr JAHHPX010000239.1 \
# --chr JAHHPX010000240.1 \
# --chr JAHHPX010000241.1 \
# --chr JAHHPX010000242.1 \
# --chr JAHHPX010000243.1 \
# --chr JAHHPX010000245.1 \
# --chr JAHHPX010000246.1 \
# --chr JAHHPX010000247.1 \
# --chr JAHHPX010000248.1 \
# --chr JAHHPX010000249.1 \
# --chr JAHHPX010000250.1 \
# --chr JAHHPX010000251.1 \
# --chr JAHHPX010000252.1 \
# --chr JAHHPX010000253.1 \
# --chr JAHHPX010000255.1 \
# --chr JAHHPX010000256.1 \
# --chr JAHHPX010000257.1 \
# --chr JAHHPX010000258.1 \
# --chr JAHHPX010000259.1 \
# --chr JAHHPX010000260.1 \
# --chr JAHHPX010000261.1 \
# --chr JAHHPX010000262.1 \
# --chr JAHHPX010000263.1 \
# --chr JAHHPX010000264.1 \
# --chr JAHHPX010000265.1 \
# --chr JAHHPX010000266.1 \
# --chr JAHHPX010000267.1 \
# --chr JAHHPX010000268.1 \
# --chr JAHHPX010000270.1 \
# --chr JAHHPX010000272.1 \
# --chr JAHHPX010000273.1 \
# --chr JAHHPX010000274.1 \
# --chr JAHHPX010000275.1 \
# --chr JAHHPX010000276.1 \
# --chr JAHHPX010000277.1 \
# --chr JAHHPX010000278.1 \
# --chr JAHHPX010000279.1 \
# --chr JAHHPX010000280.1 \
# --chr JAHHPX010000281.1 \
# --chr JAHHPX010000282.1 \
# --chr JAHHPX010000284.1 \
# --chr JAHHPX010000285.1 \
# --chr JAHHPX010000286.1 \
# --chr JAHHPX010000287.1 \
# --chr JAHHPX010000288.1 \
# --chr JAHHPX010000289.1 \
# --chr JAHHPX010000290.1 \
# --chr JAHHPX010000291.1 \
# --chr JAHHPX010000292.1 \
# --chr JAHHPX010000293.1 \
# --chr JAHHPX010000294.1 \
# --chr JAHHPX010000295.1 \
# --chr JAHHPX010000296.1 \
# --chr JAHHPX010000297.1 \
# --chr JAHHPX010000298.1 \
# --chr JAHHPX010000299.1 \
# --chr JAHHPX010000300.1 \
# --chr JAHHPX010000301.1 \
# --chr JAHHPX010000302.1 \
# --chr JAHHPX010000303.1 \
# --chr JAHHPX010000304.1 \
# --chr JAHHPX010000305.1 \
# --chr JAHHPX010000306.1 \
# --chr JAHHPX010000307.1 \
# --chr JAHHPX010000309.1 \
# --chr JAHHPX010000310.1 \
# --chr JAHHPX010000312.1 \
# --chr JAHHPX010000313.1 \
# --chr JAHHPX010000314.1 \
# --chr JAHHPX010000315.1 \
# --chr JAHHPX010000316.1 \
# --chr JAHHPX010000317.1 \
# --chr JAHHPX010000318.1 \
# --chr JAHHPX010000320.1 \
# --chr JAHHPX010000321.1 \
# --chr JAHHPX010000322.1 \
# --chr JAHHPX010000323.1 \
# --chr JAHHPX010000326.1 \
# --chr JAHHPX010000327.1 \
# --chr JAHHPX010000329.1 \
# --chr JAHHPX010000330.1 \
# --chr JAHHPX010000331.1 \
# --chr JAHHPX010000332.1 \
# --chr JAHHPX010000333.1 \
# --chr JAHHPX010000334.1 \
# --chr JAHHPX010000335.1 \
# --chr JAHHPX010000336.1 \
# --chr JAHHPX010000337.1 \
# --chr JAHHPX010000338.1 \
# --chr JAHHPX010000340.1 \
# --chr JAHHPX010000341.1 \
# --chr JAHHPX010000342.1 \
# --chr JAHHPX010000343.1 \
# --chr JAHHPX010000344.1 \
# --chr JAHHPX010000349.1 \
# --chr JAHHPX010000350.1 \
# --chr JAHHPX010000351.1 \
# --chr JAHHPX010000354.1 \
# --chr JAHHPX010000355.1 \
# --chr JAHHPX010000358.1 \
# --chr JAHHPX010000359.1 \
# --chr JAHHPX010000360.1 \
# --chr JAHHPX010000361.1 \
# --chr JAHHPX010000362.1 \
# --chr JAHHPX010000363.1 \
# --chr JAHHPX010000365.1 \
# --chr JAHHPX010000366.1 \
# --chr JAHHPX010000371.1 \
# --chr JAHHPX010000373.1 \
# --chr JAHHPX010000374.1 \
# --chr JAHHPX010000375.1 \
# --chr JAHHPX010000376.1 \
# --chr JAHHPX010000378.1 \
# --chr JAHHPX010000379.1 \
# --chr JAHHPX010000380.1 \
# --chr JAHHPX010000381.1 \
# --chr JAHHPX010000382.1 \
# --chr JAHHPX010000383.1 \
# --chr JAHHPX010000384.1 \
# --chr JAHHPX010000385.1 \
# --chr JAHHPX010000386.1 \
# --chr JAHHPX010000387.1 \
# --chr JAHHPX010000388.1 \
# --chr JAHHPX010000391.1 \
# --chr JAHHPX010000392.1 \
# --chr JAHHPX010000393.1 \
# --chr JAHHPX010000394.1 \
# --chr JAHHPX010000395.1 \
# --chr JAHHPX010000396.1 \
# --chr JAHHPX010000397.1 \
# --chr JAHHPX010000398.1 \
# --chr JAHHPX010000401.1 \
# --chr JAHHPX010000402.1 \
# --chr JAHHPX010000404.1 \
# --chr JAHHPX010000405.1 \
# --chr JAHHPX010000406.1 \
# --chr JAHHPX010000407.1 \
# --chr JAHHPX010000408.1 \
# --chr JAHHPX010000409.1 \
# --chr JAHHPX010000413.1 \
# --chr JAHHPX010000415.1 \
# --chr JAHHPX010000416.1 \
# --chr JAHHPX010000417.1 \
# --chr JAHHPX010000418.1 \
# --chr JAHHPX010000419.1 \
# --chr JAHHPX010000420.1 \
# --chr JAHHPX010000421.1 \
# --chr JAHHPX010000422.1 \
# --chr JAHHPX010000425.1 \
# --chr JAHHPX010000427.1 \
# --chr JAHHPX010000428.1 \
# --chr JAHHPX010000429.1 \
# --chr JAHHPX010000430.1 \
# --chr JAHHPX010000431.1 \
# --chr JAHHPX010000432.1 \
# --chr JAHHPX010000434.1 \
# --chr JAHHPX010000435.1 \
# --chr JAHHPX010000436.1 \
# --chr JAHHPX010000438.1 \
# --chr JAHHPX010000439.1 \
# --chr JAHHPX010000440.1 \
# --chr JAHHPX010000441.1 \
# --chr JAHHPX010000442.1 \
# --chr JAHHPX010000443.1 \
# --chr JAHHPX010000445.1 \
# --chr JAHHPX010000446.1 \
# --chr JAHHPX010000447.1 \
# --chr JAHHPX010000448.1 \
# --chr JAHHPX010000449.1 \
# --chr JAHHPX010000451.1 \
# --chr JAHHPX010000452.1 \
# --chr JAHHPX010000453.1 \
# --chr JAHHPX010000454.1 \
# --chr JAHHPX010000455.1 \
# --chr JAHHPX010000456.1 \
# --chr JAHHPX010000457.1 \
# --chr JAHHPX010000458.1 \
# --chr JAHHPX010000460.1 \
# --chr JAHHPX010000461.1 \
# --chr JAHHPX010000463.1 \
# --chr JAHHPX010000465.1 \
# --chr JAHHPX010000466.1 \
# --chr JAHHPX010000467.1 \
# --chr JAHHPX010000469.1 \
# --chr JAHHPX010000470.1 \
# --chr JAHHPX010000471.1 \
# --chr JAHHPX010000472.1 \
# --chr JAHHPX010000473.1 \
# --chr JAHHPX010000474.1 \
# --chr JAHHPX010000475.1 \
# --chr JAHHPX010000476.1 \
# --chr JAHHPX010000477.1 \
# --chr JAHHPX010000478.1 \
# --chr JAHHPX010000480.1 \
# --chr JAHHPX010000481.1 \
# --chr JAHHPX010000483.1 \
# --chr JAHHPX010000485.1 \
# --chr JAHHPX010000486.1 \
# --chr JAHHPX010000487.1 \
# --chr JAHHPX010000488.1 \
# --chr JAHHPX010000491.1 \
# --chr JAHHPX010000493.1 \
# --chr JAHHPX010000494.1 \
# --chr JAHHPX010000495.1 \
# --chr JAHHPX010000496.1 \
# --chr JAHHPX010000497.1 \
# --chr JAHHPX010000498.1 \
# --chr JAHHPX010000499.1 \
# --chr JAHHPX010000500.1 \
# --chr JAHHPX010000501.1 \
# --chr JAHHPX010000502.1 \
# --chr JAHHPX010000503.1 \
# --chr JAHHPX010000504.1 \
# --chr JAHHPX010000505.1 \
# --chr JAHHPX010000506.1 \
# --chr JAHHPX010000508.1 \
# --chr JAHHPX010000509.1 \
# --chr JAHHPX010000510.1 \
# --chr JAHHPX010000511.1 \
# --chr JAHHPX010000512.1 \
# --chr JAHHPX010000513.1 \
# --chr JAHHPX010000514.1 \
# --chr JAHHPX010000516.1 \
# --chr JAHHPX010000517.1 \
# --chr JAHHPX010000518.1 \
# --chr JAHHPX010000519.1 \
# --chr JAHHPX010000520.1 \
# --chr JAHHPX010000521.1 \
# --chr JAHHPX010000523.1 \
# --chr JAHHPX010000527.1 \
# --chr JAHHPX010000528.1 \
# --chr JAHHPX010000529.1 \
# --chr JAHHPX010000530.1 \
# --chr JAHHPX010000531.1 \
# --chr JAHHPX010000532.1 \
# --chr JAHHPX010000534.1 \
# --chr JAHHPX010000535.1 \
# --chr JAHHPX010000536.1 \
# --chr JAHHPX010000537.1 \
# --chr JAHHPX010000539.1 \
# --chr JAHHPX010000540.1 \
# --chr JAHHPX010000541.1 \
# --chr JAHHPX010000542.1 \
# --chr JAHHPX010000544.1 \
# --chr JAHHPX010000545.1 \
# --chr JAHHPX010000546.1 \
# --chr JAHHPX010000547.1 \
# --chr JAHHPX010000548.1 \
# --chr JAHHPX010000550.1 \
# --chr JAHHPX010000551.1 \
# --chr JAHHPX010000552.1 \
# --chr JAHHPX010000553.1 \
# --chr JAHHPX010000554.1 \
# --chr JAHHPX010000555.1 \
# --chr JAHHPX010000556.1 \
# --chr JAHHPX010000557.1 \
# --chr JAHHPX010000558.1 \
# --chr JAHHPX010000559.1 \
# --chr JAHHPX010000561.1 \
# --chr JAHHPX010000562.1 \
# --chr JAHHPX010000563.1 \
# --chr JAHHPX010000566.1 \
# --chr JAHHPX010000569.1 \
# --chr JAHHPX010000570.1 \
# --chr JAHHPX010000571.1 \
# --chr JAHHPX010000574.1 \
# --chr JAHHPX010000575.1 \
# --chr JAHHPX010000576.1 \
# --chr JAHHPX010000577.1 \
# --chr JAHHPX010000578.1 \
# --chr JAHHPX010000579.1 \
# --chr JAHHPX010000581.1 \
# --chr JAHHPX010000585.1 \
# --chr JAHHPX010000587.1 \
# --chr JAHHPX010000588.1 \
# --chr JAHHPX010000589.1 \
# --chr JAHHPX010000590.1 \
# --chr JAHHPX010000591.1 \
# --chr JAHHPX010000592.1 \
# --chr JAHHPX010000594.1 \
# --chr JAHHPX010000595.1 \
# --chr JAHHPX010000596.1 \
# --chr JAHHPX010000597.1 \
# --chr JAHHPX010000598.1 \
# --chr JAHHPX010000599.1 \
# --chr JAHHPX010000600.1 \
# --chr JAHHPX010000601.1 \
# --chr JAHHPX010000602.1 \
# --chr JAHHPX010000603.1 \
# --chr JAHHPX010000604.1 \
# --chr JAHHPX010000605.1 \
# --chr JAHHPX010000606.1 \
# --chr JAHHPX010000608.1 \
# --chr JAHHPX010000609.1 \
# --chr JAHHPX010000610.1 \
# --chr JAHHPX010000611.1 \
# --chr JAHHPX010000613.1 \
# --chr JAHHPX010000614.1 \
# --chr JAHHPX010000615.1 \
# --chr JAHHPX010000616.1 \
# --chr JAHHPX010000617.1 \
# --chr JAHHPX010000618.1 \
# --chr JAHHPX010000620.1 \
# --chr JAHHPX010000621.1 \
# --chr JAHHPX010000623.1 \
# --chr JAHHPX010000624.1 \
# --chr JAHHPX010000628.1 \
# --chr JAHHPX010000629.1 \
# --chr JAHHPX010000630.1 \
# --chr JAHHPX010000631.1 \
# --chr JAHHPX010000633.1 \
# --chr JAHHPX010000634.1 \
# --chr JAHHPX010000635.1 \
# --chr JAHHPX010000636.1 \
# --chr JAHHPX010000637.1 \
# --chr JAHHPX010000639.1 \
# --chr JAHHPX010000640.1 \
# --chr JAHHPX010000641.1 \
# --chr JAHHPX010000643.1 \
# --chr JAHHPX010000644.1 \
# --chr JAHHPX010000645.1 \
# --chr JAHHPX010000646.1 \
# --chr JAHHPX010000647.1 \
# --chr JAHHPX010000648.1 \
# --chr JAHHPX010000649.1 \
# --chr JAHHPX010000650.1 \
# --chr JAHHPX010000651.1 \
# --chr JAHHPX010000652.1 \
# --chr JAHHPX010000653.1 \
# --chr JAHHPX010000654.1 \
# --chr JAHHPX010000656.1 \
# --chr JAHHPX010000657.1 \
# --chr JAHHPX010000658.1 \
# --chr JAHHPX010000661.1 \
# --chr JAHHPX010000662.1 \
# --chr JAHHPX010000663.1 \
# --chr JAHHPX010000665.1 \
# --chr JAHHPX010000667.1 \
# --chr JAHHPX010000668.1 \
# --chr JAHHPX010000669.1 \
# --chr JAHHPX010000671.1 \
# --chr JAHHPX010000672.1 \
# --chr JAHHPX010000674.1 \
# --chr JAHHPX010000675.1 \
# --chr JAHHPX010000679.1 \
# --chr JAHHPX010000681.1 \
# --chr JAHHPX010000682.1 \
# --chr JAHHPX010000683.1 \
# --chr JAHHPX010000684.1 \
# --chr JAHHPX010000685.1 \
# --chr JAHHPX010000686.1 \
# --chr JAHHPX010000687.1 \
# --chr JAHHPX010000688.1 \
# --chr JAHHPX010000690.1 \
# --chr JAHHPX010000691.1 \
# --chr JAHHPX010000692.1 \
# --chr JAHHPX010000693.1 \
# --chr JAHHPX010000694.1 \
# --chr JAHHPX010000695.1 \
# --chr JAHHPX010000696.1 \
# --chr JAHHPX010000697.1 \
# --chr JAHHPX010000699.1 \
# --chr JAHHPX010000700.1 \
# --chr JAHHPX010000702.1 \
# --chr JAHHPX010000703.1 \
# --chr JAHHPX010000705.1 \
# --chr JAHHPX010000706.1 \
# --chr JAHHPX010000710.1 \
# --chr JAHHPX010000711.1 \
# --chr JAHHPX010000712.1 \
# --chr JAHHPX010000713.1 \
# --chr JAHHPX010000714.1 \
# --chr JAHHPX010000715.1 \
# --chr JAHHPX010000717.1 \
# --chr JAHHPX010000719.1 \
# --chr JAHHPX010000720.1 \
# --chr JAHHPX010000721.1 \
# --chr JAHHPX010000722.1 \
# --chr JAHHPX010000723.1 \
# --chr JAHHPX010000724.1 \
# --chr JAHHPX010000725.1 \
# --chr JAHHPX010000726.1 \
# --chr JAHHPX010000728.1 \
# --chr JAHHPX010000729.1 \
# --chr JAHHPX010000730.1 \
# --chr JAHHPX010000731.1 \
# --chr JAHHPX010000733.1 \
# --chr JAHHPX010000737.1 \
# --chr JAHHPX010000743.1 \
# --chr JAHHPX010000745.1 \
# --chr JAHHPX010000746.1 \
# --chr JAHHPX010000747.1 \
# --chr JAHHPX010000748.1 \
# --chr JAHHPX010000750.1 \
# --chr JAHHPX010000752.1 \
# --chr JAHHPX010000754.1 \
# --chr JAHHPX010000755.1 \
# --chr JAHHPX010000756.1 \
# --chr JAHHPX010000759.1 \
# --chr JAHHPX010000760.1 \
# --chr JAHHPX010000761.1 \
# --chr JAHHPX010000762.1 \
# --chr JAHHPX010000763.1 \
# --chr JAHHPX010000765.1 \
# --chr JAHHPX010000766.1 \
# --chr JAHHPX010000767.1 \
# --chr JAHHPX010000771.1 \
# --chr JAHHPX010000772.1 \
# --chr JAHHPX010000773.1 \
# --chr JAHHPX010000774.1 \
# --chr JAHHPX010000775.1 \
# --chr JAHHPX010000776.1 \
# --chr JAHHPX010000777.1 \
# --chr JAHHPX010000783.1 \
# --chr JAHHPX010000784.1 \
# --chr JAHHPX010000785.1 \
# --chr JAHHPX010000786.1 \
# --chr JAHHPX010000789.1 \
# --chr JAHHPX010000792.1 \
# --chr JAHHPX010000796.1 \
# --chr JAHHPX010000797.1 \
# --chr JAHHPX010000799.1 \
# --chr JAHHPX010000800.1 \
# --chr JAHHPX010000802.1 \
# --chr JAHHPX010000803.1 \
# --chr JAHHPX010000805.1 \
# --chr JAHHPX010000811.1 \
# --chr JAHHPX010000812.1 \
# --chr JAHHPX010000814.1 \
# --chr JAHHPX010000815.1 \
# --chr JAHHPX010000816.1 \
# --chr JAHHPX010000826.1 \
# --chr JAHHPX010000829.1 \
# --chr JAHHPX010000833.1 \
# --chr JAHHPX010000838.1 \
# --chr JAHHPX010000839.1 \
# --chr JAHHPX010000847.1 \
# --chr JAHHPX010000852.1 \
# --chr JAHHPX010000854.1 \
# --chr JAHHPX010000855.1 \
# --chr JAHHPX010000867.1 \
# --chr JAHHPX010000871.1 \
# --chr JAHHPX010000893.1 \
# --chr JAHHPX010000907.1 \
# --chr JAHHPX010000934.1 \
# --chr JAHHPX010000936.1 \
# --chr JAHHPX010000942.1 \
# --chr JAHHPX010000951.1 \
# --chr JAHHPX010000953.1 \
# --chr JAHHPX010001007.1 \
# --out filtcontigs_d_ordii \
# --recode --recode-INFO-all

## --------------------------------
## Check VCF stats
module purge
# module load bcftools/1.13
module load vcftools/0.1.14

# bgzip -c -i filtcontigs_d_ordii.recode.vcf > filtcontigs_d_ordii.recode.vcf.gz

vcftools --gzvcf filtcontigs_d_ordii.recode.vcf.gz --depth --out filtcontigs_d_ordii_depth

## --------------------------------
## Copy results back to project output directory (in home)
# cp *.fq.gz /home/aubaxh002/psmc/output/

mail -s 'PSMC ordii VCF filtering finished' avrilharder@gmail.com <<< 'bcftools finished'












