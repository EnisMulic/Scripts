#!/usr/bin/bash +x

############################################################################
#
# Usage: . ini2env file prefix
#
# Create environment variables from a ini configuration file
# 
# Note: use . ini2env to export env variables to parent process
#
# Options:
#   file
#   prefix
#
# Example:
#   config.ini
#       [section]
#       key = value
#   output:
#       PREFIX_SECTION_KEY=value
#
############################################################################


file=$1
prefix=$2

while IPS='= ' read var val
do
    if [[ $var == \[*] ]]
    then
        section=$(echo $var | sed 's/^.//;s/.$//')
    elif [[ $val ]]
    then
        key=$(echo "${prefix}_${section}_${var}" | tr '[a-z]' '[A-Z]')
        export "${key}=${val}"
    fi
done < $file