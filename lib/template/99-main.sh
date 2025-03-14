main(){
  info_echo "$DESCRIPTION"
  verb_echo "$DESCRIPTION_verbose"
  
  if [ -z $1 ]; then
    defualt_action
  else
    parse_action "$@"
  fi

}