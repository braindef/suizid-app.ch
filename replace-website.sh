#!/bin/sh

usage="$(basename "$0") [OPTION...] replace all website information 

you need to checkout baseproject github.com/braindef/suizid-app.ch with submodules recurisvely

where:
    -h  show this help text
    -s  set the website
    -c  clone git repo"

website="ns3.ignored.ch"
while getopts ':hcs:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    c) git clone --recursive https://github.com/braindef/suizid-app.ch
       exit
       ;;
    s) website=$OPTARG
       find ./suizid-app.ch -type f -print0 | xargs -0 sed -i 's/ns3.ignored.ch/'$website'/g'
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done


