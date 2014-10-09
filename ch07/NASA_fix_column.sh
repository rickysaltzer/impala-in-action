#!/usr/bin/env python

import sys
import fileinput
import re

number=re.compile("^[0-9]")
for line in fileinput.input():
  tokens=line.strip().split('\t')
  if len(tokens)>4:
    tokens[2]=tokens[2].strip().replace("\n","").replace("\r","")
    m=number.search(tokens[3].strip())
    if m is None:
      m=number.search(tokens[4].strip())
      if m is None:
        sys.stderr.write("Error: invalid line {0}".format(line))
      else:
        sys.stdout.write( "{0}\t{1}\t{2}{3}\t{4}\t\n".format(tokens[0],tokens[1],tokens[2],tokens[3],tokens[4]) )
    else:
      sys.stdout.write(line)
  elif len(tokens)==4:
      sys.stdout.write(line)
  else:
    sys.stderr.write("Error: length is only {0} for line {1}".format(len(tokens),line))
