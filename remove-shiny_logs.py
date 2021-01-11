#!/usr/bin/python

# run by crontab
# removes any files in /shiny_logs/ older than 30 days

import os, sys, time
from subprocess import call

def get_file_directory(file):
    return os.path.dirname(os.path.abspath(file))

now = time.time()
cutoff = now - (30 * 86400)

files = os.listdir(os.path.join(get_file_directory(__file__), "shiny_logs"))
file_path = os.path.join(get_file_directory(__file__), "shiny_logs/")

for xfile in files:
    if os.path.isfile(str(file_path) + xfile):
        t = os.stat(str(file_path) + xfile)
        c = t.st_ctime

        if c < cutoff and xfile.endswith(".log"):	
            os.remove(str(file_path) + xfile)
            print("Log: {} removed.".format(str(file_path) + xfile))