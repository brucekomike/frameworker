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
  info_echo(){ echo "\$@"; }
  action_loader base
  main "${ORIGINAL_ARGS[@]}"
  action_loader "$APP"
EOF
)
}

function frameworker_config(){
  export shell_type="${1:-$(basename "$SHELL")}"
  export frameworker_env_file="$HOME/.config/frameworker.conf"
  export frameworker_exec_file="$HOME/.local/bin/frameworker"
}

function frameworker_env() {
  # use given shell or auto detect
  frameworker_config "$1"
  ensure_dir "$HOME/.config"
  ensure_dir "$HOME/.local/bin"
  # check if config file and execute file exists
  if [[ -f $frameworker_env_file ]] && [[ -f $frameworker_exec_file ]]; then
    info_echo "file linking already setup, skipping..."
  else
    echo "$Working_DIR" > $frameworker_env_file
    ln -s $Working_DIR/frameworker $frameworker_exec_file
    info_echo "env setup for the current user"
  fi
  if detect_section "$HOME/.${shell_type}rc"; then
    info_echo "PATH already updated in $HOME/.${shell_type}rc, skipping..."  
  else
    write_section "export PATH=\"$HOME/.local/bin:\$PATH\"" "$HOME/.${shell_type}rc" 
    info_echo "PATH updated in $HOME/.${shell_type}rc"
  fi
}

function frameworker_de_env() {
  frameworker_config "$1"
  if [[ -f $frameworker_env_file ]] && [[ -f $frameworker_exec_file ]]; then
    rm $frameworker_exec_file 
    rm $frameworker_env_file
    info_echo "env files removed"
  else
    info_echo "env files not found, skipping..."
  fi
  if detect_section "$HOME/.${shell_type}rc"; then
    remove_section "$HOME/.${shell_type}rc"
    info_echo "PATH in $HOME/.${shell_type}rc removed"
  else
    info_echo "PATH not found in $HOME/.${shell_type}rc, skipping..."    
  fi
}
