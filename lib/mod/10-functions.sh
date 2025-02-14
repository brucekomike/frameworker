# File containing the name and Git URL pairs
CONFIG_FILE="$scripts_DIR/config.txt"


function fetchurl(){
if [[ ! -f $CONFIG_FILE ]]; then
touch $CONFIG_FILE
echo "#framewoker config file, please keep this line in favor of grep">> $CONFIG_FILE
fi
local NAME_TO_FIND="$1"
# Read the file line by line
while IFS=" " read -r NAME GIT_URL; do
    # Skip empty lines or lines starting with #
    if [ -z "$NAME" ] || [[ "$NAME" == \#* ]]; then
        continue
    fi

    # Check if the name matches
    if [ "$NAME" == "$NAME_TO_FIND" ]; then
        echo "$GIT_URL"
        return 0
    fi
done < "$CONFIG_FILE"
script_exit "that app not exsit" 1
return 127
}

#$1 for mod name
#$2 for url
function writeurl(){
    if [[ ! -f $CONFIG_FILE ]]; then
    touch $CONFIG_FILE
    echo "#framewoker config file, please keep this line in favor of grep">> $CONFIG_FILE
    fi
    grep -v "^$1" $CONFIG_FILE > temp
    mv temp $CONFIG_FILE
    echo $1 $2 >> $CONFIG_FILE
}
#$1 for url
#$2 for mod name
function install(){
    if [[ -n "$1" ]] && [[ -n "$2" ]] && is_not_reserved; then
        writeurl $2 $1
        if [[ -d ./lib/"$2" ]]; then
            if ask_yes_no "folder exists ,procced?";then
            rm -rf ./lib/"$2"
            else
            script_exit "stoping" 0
            fi
        fi
        git clone --depth 1 "$1" ./lib/"$2";
        else 
        script_exit "please provide both <url> and <name>
see \"$base_CMD help\"" 1;
    fi
}

is_not_reserved() {
    local reserved=("help" "list" "mod" "base" "template")  # Array of reserved words
    local input="$1"                                        # The variable to check

    for word in "${reserved[@]}"; do
        if [[ "$input" == "$word" ]]; then
            script_exit "this script prevent using reserved word for installation" 1
        fi
    done

    return 0  # Return 0 if no match is found
}

function update(){
    verb_echo "starting update"
    app_name="$1"
    if [[ -n "$1" ]]; then
        verb_echo "variable passed, start config file test"
        if [[ -f "$CONFIG_FILE" ]]; then
            repo_url=$(fetchurl $1);
            verb_echo "start path detection"
            if [[ -d "./lib/$1" ]]; then
            verb_echo "path exsits, starting update"
            cd ./lib/$1
            git pull --depth 1 --rebase
            cd ../..
            else
            script_exit "the path not exsit 
see \"$base_CMD help\"" 1;
            fi
        else
            script_exit "no config file, try install any thing
see \"$base_CMD help\"" 1;
        fi
    else 
        info_echo "path not provided, try update all"
        update_all
    fi
}

function update_all() {
    verb_echo "Starting recursive update for all libraries"
    # Ensure CONFIG_FILE exists
    if [[ ! -f "$CONFIG_FILE" ]]; then
        script_exit "Config file not found: $CONFIG_FILE. Cannot perform update_all." 1
    fi
    # Read the config file line by line
    while IFS=" " read -r NAME GIT_URL; do
        # Skip empty lines or lines starting with #
        if [[ -z "$NAME" || "$NAME" == \#* ]]; then
            continue
        fi
        verb_echo "Processing library: $NAME"

        # Check if the library directory exists
        if [[ -d "./lib/$NAME" ]]; then
            # If the directory exists, pull the latest changes
            verb_echo "Updating existing library: $NAME"
            (
                cd "./lib/$NAME" || script_exit "Failed to navigate to ./lib/$NAME" 1
                git pull --depth 1 --rebase || script_exit "Failed to update $NAME" 1
            )
        else
            # If the directory does not exist, clone the repository
            verb_echo "Cloning new library: $NAME"
            git clone --depth 1 "$GIT_URL" "./lib/$NAME" || script_exit "Failed to clone $NAME from $GIT_URL" 1
        fi
    done < "$CONFIG_FILE"

    verb_echo "All libraries updated successfully."
}