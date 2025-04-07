function print(){
  info_echo "$(echo $@)"
}
function cli_env(){
  bash --rcfile <(cat <<EOF
  source /etc/profile
  source $HOME/.bashrc
  # Export the Working_DIR variable
  export Working_DIR="$Working_DIR"

  # Export the action_loader function
  export -f action_loader

  # Call the action_loader function again in the new shell
  action_loader base
  main "${ORIGINAL_ARGS[@]}"
  action_loader "$APP"
EOF
)
}
