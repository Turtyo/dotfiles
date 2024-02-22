#!/usr/bin/env bash

gmv(){
 while getopts "h-:" opt; do
        case "$opt" in
            h) print_help ;;
            -) case "${OPTARG}" in
                   help) print_help ;;
               esac ;;
        esac
    done

    shift $((OPTIND - 1))
# parent could be a value that we give, code should be modified
parent="${3:-$(grit stat "$1" | awk -F '[()]' '{print $2; exit}')}" 
grit unlink "$parent" "$1" && grit link "$2" "$1"
}

print_help(){
    echo "Expected format for gmv function:"
    echo "gmv node_to_move target_parent [original_parent]"
}

gmv "$@"
