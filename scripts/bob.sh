BOB=$( dirname $( dirname $0 ) )
function bob.help () {
	echo Usage: 
	echo "    bob CLIENT"
	echo
	echo "CLIENTS:"
	for ii in `ls -1 $BOB/clients`; do
		[ -f $BOB/clients/$ii/main.sh ] && echo "    bob $ii"
	done
	echo
	echo Respect the bob.
}	

case .$1 in
	.)       echo Try \'bob --help\' ; echo Respect the bob. ; exit ;;
	..)      shift; bob.$*; exit ;;
	.--exit) exit $2 ;;
	.--help) bob.help ; exit ;;
	.marco)  echo polo ; exit ;;
esac

if [ -x $BOB/clients/$1/main.sh ]; then
	$BOB/clients/$1/main.sh $*
	exit
fi

echo Bob says: what\'s $1?
echo Respect the bob.
