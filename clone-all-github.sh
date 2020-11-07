#!/bin/bash

############################################################################
#
# Usage: clone-all-github.sh [option] name pages
#
# Clone all github repositories from a single user or organization 
#
# Options:
#  users
#  orgs
#
# Limitations: 
#  . only one option should be given
#
############################################################################

cntx=$1
name=$2
max=$3

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

