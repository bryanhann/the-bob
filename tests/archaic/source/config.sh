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
	exp=$3
	echo -n [....] $des
	eval $cmd
	got=$?
	echo -n "   exp:[$exp] got:[$got]"
	backspace
	#sleep 1
	export TESTED=$(( $TESTED + 1 ))
	[ "$exp" == "$got" ] && echo "[ ok ]" && return 0
	echo "[fail]"
	export FAILED=$(( $FAILED + 1 ))
}


