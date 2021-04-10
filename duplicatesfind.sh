# time find photos/ ! -path '**.git/*' ! -empty -type f -exec md5sum    {} \; | sort | uniq -w 32  --all-repeated=separate
# time find photos/ ! -path '**.git/*' ! -empty -type f -exec sha512sum {} \; | sort | uniq -w 128 --all-repeated=separate
# time find ~/storage/photos* -type f -exec sha512sum {} \; | sort | uniq -w 128 --all-repeated=separate > DUPLICATES.sh
time find ~/storage/Music -type f -exec sha512sum {} \; | sort | uniq -w 128 --all-repeated=separate > DUPLICATES.sh
###################################
