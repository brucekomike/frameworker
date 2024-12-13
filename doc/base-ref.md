# reference of the base
## functions
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
