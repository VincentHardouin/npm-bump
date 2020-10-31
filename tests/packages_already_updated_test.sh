#!/usr/bin/env bash

# it should display message when no package are updated
# given
current_dir=$PWD
directory_under_test='./npm-directory'
expected_output="No package updated"
initial_git_state=$(git log -1 --pretty=%B)

cd $directory_under_test || exit 1
/bin/bash ../../npm-bump &> /dev/null

# when
result=$(/bin/bash ../../npm-bump)
cd "$current_dir" || exit 1

# then
git_commit_name=$(git log -1 --pretty=%B)

if [[ "$result" == "$expected_output" ]] && [[ "$git_commit_name" == "$initial_git_state" ]]; then
  exit 0
else
  exit 1
fi
