# DESC: Usage help
# ARGS: None
# OUTS: None
# RETS: None
function script_usage() {
cat << EOF 
Usage: $0 [options] <app> [action] [others]
    Options:
       -v   --verbose       Enable verbose output
       -h   --help          Display this help message
       -p   --plain         Disables colour output
       -c   --cron          Run silently unless we encounter an error

    <app>:
        The name of a directory containing shell scripts.
        Default value is: list
        "help" is reserved by base to show help messages
    [action] 
        The optional action passed to the application
    [others]
        other args will be passed to the action
EOF
}




