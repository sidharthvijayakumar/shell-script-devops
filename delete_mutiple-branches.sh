#!/bin/bash
# Get a list of remote branches matching the regex pattern
matching_branches=($(git ls-remote --heads | grep -E "/feature/.*" | awk -F'/' '{print $4}'))

# Loop through the matching branches and delete each one remotely
for branch in "${matching_branches[@]}"
do
  # Delete remotely
  git push --delete origin feature/"$branch"
done