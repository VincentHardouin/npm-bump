#!/usr/bin/env bash

function stub_npm_test() {
  replacement_text='"test": "exit 0"'
  file="$PWD/package.json"
  test_line=8
  sed -i.bak "${test_line}s/.*/${replacement_text}/" "$file" && rm "$file".bak
}

function restore_npm_test() {
  replacement_text='     "test": "exit 1"'
  file="$PWD/package.json"
  test_line=8
  sed -i.bak "${test_line}s/.*/${replacement_text}/" "$file" && rm "$file".bak
}

function remove_created_commit() {
  git reset --hard HEAD~ &> /dev/null
}

# it should display message when no package are updated
# given
current_dir=$PWD
directory_under_test='./npm-directory'
expected_output="Package|Old|New
-|-|-
lodash|4.17.19|4.17.21"
expected_commit_message="Bump lodash from 4.17.19 to 4.17.21"

cd $directory_under_test || exit
{ npm install --quiet lodash@4.17.19  &> /dev/null; } 2>&1
stub_npm_test

# when
result=$(/bin/bash ../../npm-bump -m | tail -n 4)
commit_message=$(git log -1 --pretty=%B)

restore_npm_test
cd "$current_dir" || exit

# then
if [[ "$commit_message" = "$expected_commit_message" ]]; then
  remove_created_commit
else
  exit 1
fi

if [[ "$result" = "$expected_output" ]]; then
  exit 0
else
  exit 1
fi
