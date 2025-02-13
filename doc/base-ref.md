# reference of the base
## functions

### basic
- script_exit
  - $1 message to print
  - $2 exit code (default 0)
- check_binary
  - $1 name of the binary
  - $2 treat failure as a fatal error if have value
- check_superuser
  - $1 not to attempt sudo if have value
- run_as_root
  - $1 set to 0 to not try sudo
  - $@ commands to run as root

### loging
- info_echo
  - just print content
- red_echo
  - same as the previous one, but in red color.
- verb_echo
  - only print content when run with -v --verbose mode
## variables
- Working_DIR=$(pwd)
- ORIGINAL_ARGS="$@" full args 
- APP='' app name
- $scripts_DIR - the app dir
- ACTION='' first - arg after app
- BASE_LOADED=''
- OTHER_ARGS='' any args after that first arg
