# Define the main function
function main() {
    if [ "${BASE_LOADED:-0}" -eq 1 ]; then
    red_echo "the action $ACTION seems don't have a main function"
    exit 0
    fi
    trap script_trap_err ERR
    trap script_trap_exit EXIT
    script_init $@
    # Process options
    parse_params "$@"
    cron_init
    colour_init
    journal_init
    #lock_init system

    # Display help message
    if [ "${HELP:-0}" -eq 1 ] || [ "$APP" = "help" ] ; then
    script_usage
    exit 0
    fi
    # set base_loaded flag
    BASE_LOADED=1
}

# Invoke main with args if not sourced
# Approach via: https://stackoverflow.com/a/28776166/8787985
if ! (return 0 2> /dev/null); then
    main "$@"
fi