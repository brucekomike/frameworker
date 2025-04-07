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
function frameworker_env() {
  # use given shell or auto detect
  shell_type="${1:-$(basename "$SHELL")}"
  ensure_dir "$HOME/.config"
  ensure_dir "$HOME/.local/bin"
  export frameworker_env_file="$HOME/.config/frameworker"
  export frameworker_exec_file="$HOME/.local/bin/frameworker"
  # check if config file and execute file exists
if [[ -f $frameworker_env_file ]] && [[ -f $frameworker_exec_file ]]; then
    info_echo "already setup"
  else
    echo "$Working_DIR" > $frameworker_env_file
    write_section "export PATH=\"$HOME/.local/bin:\$PATH\"" "$HOME/.${shell_type}rc"
    ln -s $Working_DIR/frameworker $frameworker_exec_file
    info_echo "env setup for the current user"
  fi
}

function frameworker_de_env() {
  shell_type="$1"
  export frameworker_env_file="$HOME/.config/frameworker"
  export frameworker_exec_file="$HOME/.local/bin/frameworker"
  rm $frameworker_exec_file 
  rm $frameworker_env_file
  remove_section "$HOME/.${shell_type}rc"
  info_echo "env removed"
}
