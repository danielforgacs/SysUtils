# time find photos/ ! -path '**.git/*' ! -empty -type f -exec md5sum    {} \; | sort | uniq -w 32  --all-repeated=separate
# time find photos/ ! -path '**.git/*' ! -empty -type f -exec sha512sum {} \; | sort | uniq -w 128 --all-repeated=separate
# time find ~/storage/photos* -type f -exec sha512sum {} \; | sort | uniq -w 128 --all-repeated=separate > DUPLICATES.sh
# time find ~/storage/Music -type f -exec sha512sum {} \; | sort | uniq -w 128 --all-repeated=separate > DUPLICATES.sh
###################################

time find \
    ~/storage -type f \
    ! -path '**.git/*' \
    ! -path '**.venv/*' \
    ! -path '**dev/*' \
    ! -path '**.Trash-1000/*' \
    ! -path '**Dropbox/*' \
    ! -path '**DUPLICATES/*' \
    -exec sha512sum {} \; \
    | tee DUPLICATES2.sh


sort DUPLICATES2.sh | tee DUPLICATES2.sort.sh

uniq -w 128 --all-repeated=separate DUPLICATES2.sort.sh | tee DUPLICATES2.uniq.sh
