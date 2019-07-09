SRC=$1

DIR=$SRC.ext

mkdir $DIR

eval `fdisk -l $SRC | grep ^$SRC | awk '{ print "dd if='$SRC' bs=512 of='$DIR'/"$1" skip="$2" count="$4" ; "; }'`

