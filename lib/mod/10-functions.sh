function print(){
    info_echo "$(echo $@)"
}
function install(){
    git clone "$1" ./lib/"$2"
}
