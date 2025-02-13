# File containing the name and Git URL pairs
CONFIG_FILE="$script_DIR/config.txt"


function fetchurl(){
if [[ -f CONFIG_FILE ]]; then
touch $CONFIG_FILE
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
        return "$GIT_URL"
    fi
done < "$CONFIG_FILE"
return 127
}

function writeurl(){
    grep -v "^$1" filename > temp && mv temp $CONFIG_FILE
    echo $2 $1 >> $CONFIG_FILE
}
function install(){
    if [[ -n "$1" ]]&&[[ -n "$2" ]]; then
        writeurl $2 $1
        git clone "$1" ./lib/"$2";
        else 
        script_exit "please provide both <url> and <name>
see \"$base_CMD help\"" 1;
    fi
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
            cd "./lib/"
            rm -rf $1
            git clone --depth=1 $repo_url
            else
            script_exit "the path not exsit 
see \"$base_CMD help\"" 1;
            fi
        else
            script_exit "no config file, try install any thing
see \"$base_CMD help\"" 1;
        fi
    else 
        script_exit "path not provided
see \"$base_CMD help\"" 1;
    fi
}
