#' location of gene-level averages of AlphaMissense scores
#' @param build character(1) defaults to "hg38"
#' @export
am_gene_url = function(build = "hg38") {
   # from "https://storage.googleapis.com/dm_alphamissense/AlphaMissense_gene_%s.tsv.gz" -- but can't retrieve without auth?  so copied to OSN
  base = "https://mghp.osn.xsede.org/bir190004-bucket01/BiocAlphaMissense/AlphaMissense_gene_%s.tsv.gz"
   sprintf(base, build)
}

#' cache the text file if necessary, return reference
#' @param cache an instance of BiocFileCache
#' @param build character(1) defaults to "hg38"
#' @export
alphamis_genesum_path = function(cache = BiocFileCache::BiocFileCache(),
   build = "hg38") {
 cache_op( cache, remote = am_gene_url(build) )
}


