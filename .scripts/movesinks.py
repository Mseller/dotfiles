#!/usr/bin/python3
import sys
import subprocess
import re

def extract_sinks():
    pass

if len(sys.argv) < 2:
    # Its only the file name which is
    # specified in the argumets
    output = subprocess.run("pacmd list-sinks | grep -E 'index:|name:'", shell=True, stdout=subprocess.PIPE)
    #grep_output = subprocess.run(f"grep -E 'index:|name:' {str(pacmd_output.stdout)}", shell=True, stdout=subprocess.PIPE)
    print(str(output.stdout).replace("\\n", "\n").replace("\\t", "\t"))
