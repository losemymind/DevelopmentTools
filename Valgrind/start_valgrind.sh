#!/system/bin/sh
PACKAGE="com.snailgame.tjyd"  
VGPARAMS='-v --error-limit=no --trace-children=yes --track-fds=yes --log-file=/sdcard/$PACKAGE.%p.valgrind.log --tool=memcheck --leak-check=full --track-origins=yes'  
export TMPDIR=/data/data/$PACKAGE  
echo "Executing through valgrind: $VGPARAMS $*"
exec /data/local/Inst/bin/valgrind $VGPARAMS $*