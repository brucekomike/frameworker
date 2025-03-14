export MODULE_NAME="mod"
export DESCRIPTION="this is the $MODULE_NAME app, \
manager for apps"
export DESCRIPTION_verbose="\
you see this line since you have verbose mode enabled"
function script_usage() {
cat << EOF 
$MODULE_NAME application
Action list:
    help             - show this help
    install <URL> <name> - install content from given url
    update <name> - update content by name
Default:
    help
EOF
}

