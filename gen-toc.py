#!/usr/bin/env python

from datetime import datetime
from glob import glob
import os
import re

def atoi(text):
    return int(text) if text.isdigit() else text

def natural_keys(text):
    return [atoi(c) for c in re.split(r'(\d+)', text)]

MAIN_README_FN = "README.md"
WHERE_TOC = "Episodes:\n"

cwd = os.getcwd()
dirs = glob(os.path.join(cwd, "E*", ""))

episodes = []
for dir in dirs:
    episode = os.path.join(dir, "README.md")
    with open(episode, "r") as notes:
        episodes.append((
            notes.readline()[2:].strip(),
            episode.replace(cwd, '')[1:].strip())
        )

#gotta do some weird sorting (sort by epi number)
episodes.sort(key=lambda tup: natural_keys(tup[1]))

# get content of main readme
readme_file = open(MAIN_README_FN, "r")
readme_lines = readme_file.readlines()
# remove everything after the label, slightly dependent on file format
readme_lines = readme_lines[:readme_lines.index(WHERE_TOC) + 2]

for episode in episodes:
    # * [Episode 1: What's TLUH & Quick Container Apps](E1/README.md)
    readme_lines.append("* [{}]({})\n".format(episode[0], episode[1]))

readme_file = open(MAIN_README_FN, "w")
readme_file.writelines(readme_lines)
readme_file.close()
