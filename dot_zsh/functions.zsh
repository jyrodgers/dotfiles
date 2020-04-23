###############################################################################
# Functions
###############################################################################

# make directory and enter it
mkcd() { mkdir -p "$@" && cd "$@"; }

# ag "alias" to search for certain files
agg(){
	tag -f -g "$1"
}

# ag "alias" to search within certain files
agG(){
	tag -f -G "$1" "$2"
}

