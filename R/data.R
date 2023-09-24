#' a GRanges with GWAS hits for outcomes mentioning "asthma"
#' @docType data
#' @format GRanges
#' @note Produced on 21 Sept 2023 using `cc = gwascat::get_cached_gwascat()`, filtering
#' using `grep("sthma", cc$MAPPED_TRAIT)` and removing records with missing `CHR_POS`.
#' @examples
#' data(amentgr)
#' amentgr[1:5,1:4]
"amentgr"

#' a vector of column names for AlphaMissense tables
#' @docType data
#' @format character vector
"amnames"

#' a data.frame of gene-level mean AlphaMissense pathogenicity scores computed for hg19
#' @docType data
#' @format data.frame
#' @examples
#' data(am_genemns_hg19)
#' head(am_genemns_hg19)
"am_genemns_hg19"

#' a data.frame of gene-level mean AlphaMissense pathogenicity scores computed for hg38
#' @docType data
#' @format data.frame
#' @examples
#' data(am_genemns_hg38)
#' head(am_genemns_hg38)
"am_genemns_hg38"
