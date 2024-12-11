# DESC: Usage help
# ARGS: None
# OUTS: None
# RETS: None
function script_usage() {
cat << EOF 
Usage: $0 [options] <app> [action]
    Options:
       -v   --verbose       Enable verbose output
       -h   --help          Display this help message
       -nc  --no-colour     Disables colour output
       -cr  --cron          Run silently unless we encounter an error

    <app>:
        The name of a directory containing shell scripts.
        Default value is: template
    [action] 
        The optional action passed to the application
EOF
}




