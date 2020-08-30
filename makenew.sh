#!/bin/bash
## Works on debian, will start the bashrc totally from scratch

cat /etc/bash.bashrc > ~/.bashrc
. ~/.bashrc
