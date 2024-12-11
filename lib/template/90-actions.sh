# $1: the action
function parse_action(){
    case "$1" in
        help)
            script_usage
            ;;
        print)
            shift
            print $@
            ;;
        *)
            script_exit "unknown action $1." 1
            ;;
    esac
}