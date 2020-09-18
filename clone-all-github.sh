#!/bin/bash

# Clone all user or organization repositories

# cntx: users or orgs
# name: username or organization name
# max: max number of pages

# HOW TO USE: -c {users | orgs} -n {name} -m {number_of_pages}

cntx=''
name=''
max=''

while getopts 'c:n:m:' flag; do
  case "${flag}" in
    c) cntx="${OPTARG}" ;;
    n) name="${OPTARG}" ;;
    m) max="${OPTARG}" ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done

page=1

until [[ $page -gt $max ]]
do 
    curl "https://api.github.com/$cntx/$name/repos?page=$page&per_page=100" | 
        grep -e 'git_url*' | 
        cut -d \" -f 4 | 
        xargs -L1 git clone

    $page=$page+1
done

exit 0

