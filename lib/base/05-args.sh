function parse_params(){
OPTIONS_temp=$(getopt -o vhcp --long verbose,help,cron,plain -- $1 )
if [ $? -ne 0 ]; then
    echo "Failed to parse options."
    exit 1
fi
eval set -- "$OPTIONS_temp"
while true; do
    case "$1" in
        -v | --verbose)
            VERBOSE=1
            shift
            ;;
        -h | --help)
            HELP=1
            shift
            ;;
        -p | --plain)
            no_colour=true
            shift
            ;;
        -c | --cron)
            cron=true
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            break
            ;;
    esac
done

if [ -z "$1" ]; then
    APP="list"
else
    APP="$1"
    shift
fi

if [ -z "$1" ]; then
    ACTION=''
else
    ACTION="$1"
    shift
fi
if [ -z "$1" ]; then
    OTHER_ARGS=''
else
    OTHER_ARGS="$@"
fi
}