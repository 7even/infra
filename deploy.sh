#!/bin/bash
set -e

git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
puma -d
