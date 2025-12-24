main() {
    # If $1 (input) == "-" and then anything after.
    if [[ "$1" == --* ]]; then

	# Con == everything after "--" in the input ($1)
	con="${1#--}"
	param_h2

    elif [[ "$1" == -* ]]; then

	# Con == everything after "-" in the input ($1)
	con="${1#-}"
	param_h1

    else

	# If $1 (input) isn't
	printf "\e[31m\e[1mUnknown command '$1'\n\e[0m"
	exit 1

    fi
}

param_h1() {
    # For each character
    while IFS= read -r -n1 char; do

	# If $char is empty, go to the next entry
	if [[ -z "$char" ]]; then

	    continue

	fi
	
	# If char == ...
	case $char in

	    a)
		echo "A"
		;;

	    b) 
		echo "B"
		;;

	    c) 
		echo "C"
		;;

	    # else
	    *)
		printf "\e[31m\e[1mUnknown command '$char'\n\e[0m"
		;;
	esac
    done <<< "$con"

    # `<<< "$con"` passes $con to the "while read" statement.

}

param_h2() {
    # If $con == ...
    case $con in

	alpha)
	    echo "ALPHA"
	    ;;

	beta)
	    echo "BETA"
	    ;;

	cool-other-thing)
	    echo "COOLOTHERTHING"
	    ;;

	# else
	*)
	    printf "\e[31m\e[1mUnknown command '$con'\n\e[0m"
	    ;;
    esac
}



main "$@"
