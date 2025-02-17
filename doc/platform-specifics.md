# platform-specific docs

## macos
- the macos come with a bsd version of `getopt` which is not compatible with the gnu version. To use the gnu version, you can install `gnu-getopt` using `brew install gnu-getopt` and then the script will use the gnu version.
  - currently the script try to add `/opt/homebrew/opt/gnu-getopt/bin` to the path when darwin is detected. If you have installed `gnu-getopt` in a different location, you can add it to the script.
  - the gnu-getopt detection is written in the most previous line of the script, so it can be easily located and modified.