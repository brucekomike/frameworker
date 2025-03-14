export MODULE_NAME="template"
export DESCRIPTION="this is the $MODULE_NAME app"
export DESCRIPTION_verbose="\
you see this line since you have verbose mode enabled"
function script_usage() {
cat << EOF 
$MODULE_NAME application
Action list:
    help             - show this help
    print [contents] - print the string after the action
    shell            - enther a shell with functions loaded
Default:
    help
EOF
}

