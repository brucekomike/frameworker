function sketch(){
  # create new module sketch from this template
  verb_echo "start sketching new module"
  local NEW_MODULE_NAME="$1"
  if [[ -z $NEW_MODULE_NAME ]]; then
    error_echo "please provide a name for the new module"
    script_exit "" 1 
  fi
  if [[ -d $LIB_DIR/$NEW_MODULE_NAME ]]; then
    error_echo "module $NEW_MODULE_NAME already exists"
    script_exit "" 1 
  fi
  if [[ $NEW_MODULE_NAME == "help" ]]; then
    error_echo "'help' is reserved"
    script_exit "" 1 
  fi 
  cp -r $LIB_DIR/template $LIB_DIR/$NEW_MODULE_NAME
  rm $LIB_DIR/$NEW_MODULE_NAME/20-sketcher.sh
  info_echo "new module created at $LIB_DIR/$NEW_MODULE_NAME"
  verb_echo "end sketching new module"
}