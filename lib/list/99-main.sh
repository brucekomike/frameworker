function main(){
  info_echo "Action lists:"
  action_list=$(ls -1 "$LIB_DIR" | tr '\n' ' ')
  info_echo "    $action_list"
}
