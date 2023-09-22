# BiocAlphaMissense

This package provides elementary interfaces to AlphaMissense resources, using BiocFileCache, Rsamtools, and GenomicRanges.

The vignette demonstrates how a collection of several thousand records
on GWAS hits for asthma can be filtered to SNVs that are "likely pathogenic":

```
##   CHR_ID   CHR_POS STRONGEST.SNP.RISK.ALLELE OR.or.BETA MAPPED_TRAIT
## 1      5  14610200              rs16903574-G  1.0862118       asthma
## 2      1  12115601               rs2230624-A  0.1618169       asthma
## 3      9 128721272              rs11539209-A         NA       asthma
##   MAPPED_GENE          am_class
## 1     OTULINL likely_pathogenic
## 2     TNFRSF8 likely_pathogenic
## 3     ZDHHC12 likely_pathogenic
```
