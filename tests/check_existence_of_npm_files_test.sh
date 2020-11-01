#!/usr/bin/env bash

# it should display error message when package.json or package-lock.json are not present on directory
# given
current_dir=$PWD
directory_under_test='./empty-directory'
expected_output="No package.json in directory"
initial_git_state=$(git log -1 --pretty=%B)

# when
cd $directory_under_test || exit 1
result=$(/bin/bash ../../npm-bump)
cd "$current_dir" || exit 1

# then
git_commit_name=$(git log -1 --pretty=%B)

if [[ "$result" = "$expected_output" ]] && [[ "$git_commit_name" == "$initial_git_state" ]]; then
  exit 0
else
  exit 1
fi
