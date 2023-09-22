#' produce URLs for AlphaMissense SNV results lodged in NSF Open Storage Network
#' @param build character(1) defaults to "hg38"
#' @examples
#' osn_alphamis_url()
#' @export
osn_alphamis_url = function(build = "hg38") {
   base = "https://mghp.osn.xsede.org/bir190004-bucket01/BiocAlphaMissense/AlphaMissense_%s.tsv.gz"
   sprintf(base, build)
}

cache_op = function( cache, remote_target ) {
   chk = bfcquery( cache, paste0(basename(remote_target), "$") )
   if (nrow(chk) > 1) message(sprintf("multiple %s found in cache, using last", 
      basename(remote_target)))
   if (nrow(chk) == 0) gz_ref = bfcadd( cache, rname = remote_target, 
      rtype = "web", action = "copy", download = TRUE )
   else gz_ref = chk[nrow(chk),]$rpath
   gz_ref
}

#' obtain AlphaMissense TabixFile from cache, after
#' retrieving the relevant resource if not present there
#' @importFrom BiocFileCache bfcadd bfcquery
#' @importFrom Rsamtools TabixFile
#' @param cache An instance of BiocFileCache
#' @param build character(1) defaults to "hg38"
#' @note First invocation on a given R deployment will
#' a) request that a cache be built if BiocFileCache has
#' never been used, b) populate the cache with ~600MB
#' of bgzipped tabix-indexed variant-level data.
#' @examples
#' ca = BiocFileCache::BiocFileCache()
#' txf = get_alphamis_txf(ca) # will download if data are not already cached
#' Rsamtools::yieldSize(txf) = 10L
#' read.delim(text=Rsamtools::scanTabix(txf)[[1]], h=FALSE) 
#' @export
get_alphamis_txf = function(cache = BiocFileCache::BiocFileCache(),
   build = "hg38") {
   target_gz = osn_alphamis_url(build=build)
   target_tbi = paste0(target_gz, ".tbi")
   rname_gz = basename(target_gz)
   gz_ref = cache_op( cache=cache, remote_target = target_gz )
   tbi_ref = cache_op( cache=cache, remote_target = target_tbi )
   TabixFile(gz_ref, index=tbi_ref)
}
   
