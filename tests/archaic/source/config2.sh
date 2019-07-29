function test_begin {
	FAILED=0
	TESTED=0
}

function test_end {
	echo "Ran $TESTED test(s) with $FAILED failures(s)."
}

function backspace {
echo -e -n "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
echo -e -n "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
echo -e -n "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
}

function info {
	echo [info] $*
}

function return_with {
	return $1
}

function runtest {
	des=$1
	cmd=$2	
	exp=0
	while [ ! "$3" == "" ]; do
		if [ "$3" == "--err" ]; then
			exp=$4
			shift 2
			continue
		fi
		shift
	done

        
	echo -n [....] $des
	eval $cmd
	got=$?
	#echo -n "   exp:[$exp] got:[$got]"
	backspace
	#sleep 1
	export TESTED=$(( $TESTED + 1 ))
	[ "$exp" == "$got" ] && echo "[ ok ]" && return 0
	echo "[fail]"
	export FAILED=$(( $FAILED + 1 ))
}

function testdir {
	# confirm that $1 is a writeable directory 
	# in which an executable script can be placed.

	DIR=$1
	[ ! "$DIR" == "" ] || return 10
	[ -d "$DIR"      ] || return 20

	NAME=$RANDOM
	SCRIPT=$DIR/$NAME

	touch $SCRIPT || return 30
	chmod +x $SCRIPT || return 40
	$SCRIPT || return 50
	rm $SCRIPT
}
