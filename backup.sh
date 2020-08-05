dirdate=$(date +%Y-%m-%d_%H-%M-%S)
bkproot=/media/ford/PENDRIVE_BACKUP/__BACKUP__/backup_$dirdate
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
	$storagesrc $storagedest

echo "--> diff:"

diff -r -q $storagesrc $storagedest

echo "--> clean up:"

find $storagedest -name '.Trash-1000' -type d -print0 | xargs -0 rm -rf
find $storagedest -name '.venv*' -type d -print0 | xargs -0 rm -rf

echo "--> diff after clen up:"

diff -r -q $storagesrc $storagedest

echo "--> storage size:"
du -c -h -s $storagedest
echo "====================================================="
