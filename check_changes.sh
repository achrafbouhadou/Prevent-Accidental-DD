#!/bin/bash

# Get a list of changed files
changed_files=$(git diff --cached --name-only)

# Initialize a flag to track if the check passes
check_passed=true

# Initialize an array to hold files with issues
files_with_issues=()

# Iterate over each changed file
for file in $changed_files; 
do
    # Check if the file contains dd() and store the matching lines
    if grep -n -E 'dd\(' "$file"; then
        check_passed=false
        files_with_issues+=("$file")
    fi
done
# Check if any files had issues
if [ "$check_passed" = false ]; then
    echo "Check failed. The following files contain 'dd()':"
    for file in "${files_with_issues[@]}"; 
    do
        echo "$file:"
        # Print the lines containing dd() with line numbers
        grep -n -E 'dd\(' "$file"
    done
    exit 1
else
    echo "Check passed. No 'dd()' found in changed files."
fi
