#!/usr/bin/env python

import sys, configparser, os

config = configparser.ConfigParser(interpolation=None)
config.read_file(sys.stdin)

prefix = sys.argv[1].upper()

for sec in config.sections():
    for key, val in config.items(sec):
        os.environ[f"{prefix}_{sec.upper()}_{key.upper()}"] = val