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
    install)
      shift
      install $@
      ;;
    dev)
      shift
      strapper_dev $@
      ;;
    dedev)
      shift
      strapper_dedev $@
      ;;
    update)
      shift
      update $@
      ;;
    *)
      script_exit "unknown action $1." 1
      ;;
  esac
}
