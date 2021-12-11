#!/usr/bin/env python

############################################################################
#
# Usage: cat config.ini | ini2env.py prefix
#
# Create environment variables from a ini configuration file
#
# Options:
#   prefix
#
# Example:
#   config.ini
#       [section]
#       key = value
#   output:
#       PREFIX_SECTION_KEY=VALUE
#
############################################################################


import sys, configparser, os

config = configparser.ConfigParser(interpolation=None)
config.read_file(sys.stdin)

prefix = sys.argv[1].upper()

for sec in config.sections():
    for key, val in config.items(sec):
        os.environ[f"{prefix}_{sec.upper()}_{key.upper()}"] = val