dirdate=$(date +%Y-%m-%d_%H-%M-%S)
bkproot=/media/ford/SMALL_BKP/__BACKUP__/backup_$dirdate
storagesrc=$HOME/storage/
storagedest=$bkproot/storage/

echo "====================================================="
date
echo "--> backup root: $bkproot"
echo "--> storage source: $storagesrc"
echo "--> storage dest: $storagedest"

mkdir $bkproot
mkdir -p $storagedest

time sudo rsync \
	-a \
	-v \
	--exclude VBoxMachines/ \
	--exclude .Trash-1000/ \
	--exclude **/.venv*/ \
	--exclude **/.postgres_local*/ \
	--exclude Dropbox/.dropbox.cache/ \
	--exclude Dropbox/.dropbox \
	--exclude foundation-trilogy_bbc-radio_1973_complete/ \
	--exclude "Job Hunt - 2020"/ \
	--exclude "Job Hunt - 2021"/ \
	--exclude Lenovo/ \
	--exclude Router/ \
	--exclude "sleep videos"/ \
	--exclude "tutorial - youtube"/ \
	--exclude Youtube-DL/ \
	$storagesrc $storagedest

echo "--> diff:"

diff -r -q $storagesrc $storagedest

echo "--> storage size:"
du -c -h -s $storagedest
echo "====================================================="
