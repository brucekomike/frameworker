function info_echo(){
    pretty_print "$1" "${fg_green-}"
}

function verb_echo(){
    verbose_print "$@" "${fg_cyan-}"
}

function red_echo(){
    pretty_print "$@" "${bg_red-}"
}