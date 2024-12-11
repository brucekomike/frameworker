function parse_params(){
OPTIONS_temp=$(getopt -o vhf: --long verbose,help,file: -- $1 )
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
        -nc | --no-colour)
            no_colour=true
            shift
            ;;
        -cr | --cron)
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
    APP="template"
else
    APP="$1"
fi
if [ -z "$2" ]; then
    ACTION=''
else
    ACTION="$2"
fi
}