function strapper_dev(){
  is_not_reserved $1
  if ! [[ -n $1 ]];then
    red_echo "mod not provided"
    script_exit "please provide the mod name" 1
  fi
  mod_dir="$LIB_DIR/$1"
  next_dir="../../$1"
  if [[ -d "$mod_dir" ]]; then
    mv "$mod_dir" "$next_dir"
    ln -s "$next_dir" "$mod_dir" 
    info_echo "mod $1 moved out and linked back"
  else 
    red_echo "mod $1 not found."
    script_exit "mod none exsit" 1
  fi
}

function strapper_dedev(){
  is_not_reserved $1
  if ! [[ -n $1 ]];then
    red_echo "mod not provided"
    script_exit "please provide the mod name" 1
  fi
  mod_dir="$LIB_DIR/$1"
  back_dir="$mod_dir"
  mod_dir="$LIB_DIR/../../$1"
  
  if [[ -d "$mod_dir" ]]; then
    rm "$back_dir"
    mv "$mod_dir" "$back_dir" 
    info_echo "mod $1 moved back"
  else 
    red_echo "mod $1 not found."
    script_exit "mod none exsit" 1
  fi
}