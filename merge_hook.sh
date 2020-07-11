#!/usr/bin/env bash
# -------------------------------------------------------------#
# Avoid merge from staging branch to any other branches        #
# -------------------------------------------------------------#
# Kishor Vishe  <kishorvishe19@yahoo.in>

# Translation in bash and customization from this ruby script:
# https://gist.github.com/mwise/69ec35b646b52d98050d#file-prepare-commit-msg

# This git hook will prevent merging of staging branch (pull) into any local branch

# Put this file in your local repo, in the .git/hooks folder
# and make sure it is executable.
# The name of the file *must* be "prepare-commit-msg" for Git to pick it up.

FORBIDDEN_BRANCH="stg"

# Check for merges
if [[ $2 != 'merge' ]]; then
    # Not a merge
    exit 0
fi

# Merging from
FROM_BRANCH=$(head -n 1 $1 | sed -e "s/^\s*Merge .*\?branch '\(.*\?\)'.*$/\1/")

if [[ $FROM_BRANCH = $FORBIDDEN_BRANCH ]]; then
       echo " You are trying to merge ${FROM_BRANCH} into the current branch."
       echo " Surely you don't mean that?"
       echo 
       echo " run the following command now to discard your working tree changes:"
       echo 
       echo " git reset --merge"
       echo 
       exit 1
fi
