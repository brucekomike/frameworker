function info_echo(){
    pretty_print "$@" "${fg_green-}"
}

function verb_echo(){
    verbose_print "$@"
}

function red_echo(){
    verbose_print "$@" "${bg_red-}"
}