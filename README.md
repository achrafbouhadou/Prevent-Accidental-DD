# Prevent-Accidental-DD

## Introduction

This repository provides a shell script to prevent accidental commits containing `dd()` statements in your code. This script helps maintain clean and production-ready commits by blocking any commit that includes `dd()`.

## Setup Instructions

### Step 1: Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/achrafbouhadou/Prevent-Accidental-DD.git
```
### Step 2: Navigate to Your Project Directory
Go to the root directory of your project where you want to use this script.

### Step 3: Copy the Script
Copy the check_changes.sh script from this repository to the root directory of your project:

```bash
cp /path/to/cloned/repository/check_changes.sh /path/to/your/project/
```
### Step 4: Make the Script Executable
Make the check_changes.sh script executable by running:

```bash
chmod +x /path/to/your/project/check_changes.sh
```
### Step 5: Set Up the Git Hook
Navigate to your project's .git/hooks directory and create a pre-commit file if it doesn't exist:

```bash
cd /path/to/your/project/.git/hooks
touch pre-commit
```
Edit the pre-commit file to include the following line:

```bash
#!/bin/bash
/path/to/your/project/check_changes.sh
```
Make the pre-commit hook executable:

```bash
chmod +x /path/to/your/project/.git/hooks/pre-commit
```
### Step 6: Test the Setup
Make some changes in your project and include a dd() statement. Try to commit the changes:

```bash
git add .
git commit -m "Testing pre-commit hook"
```
If the script finds any dd() statements, it will block the commit and list the offending lines. Remove the dd() statements and commit again.

### Conclusion

By following these steps, you can ensure that no dd() statements make it into your committed code, keeping your repository clean and professional. If you have any questions or suggestions, feel free to open an issue or contribute to the repository.
