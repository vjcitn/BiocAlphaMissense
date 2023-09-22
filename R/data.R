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
