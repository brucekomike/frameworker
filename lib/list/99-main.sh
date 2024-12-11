function main(){
  info_echo "Action lists:"
  action_list=$(ls -1 ./lib | tr '\n' ' ')
  info_echo "    $action_list"
}
