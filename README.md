# Backup and Restore Project

## Overview

This project consists of two Bash scripts designed for automating the backup and restoration of files and directories:

- Backup Script: Regularly backs up a source directory to a destination directory. It accepts the following parameters:
  1. source: The directory or file to back up.
  2. destination: The directory where the backup will be stored.
  3. interval_seconds: The interval (in seconds) between each backup operation.
  4. Max_backups: The maximum number of backups to retain. When the number of backups exceeds this limit, the oldest backup is removed.

- Restore Script: Restores files from the latest backup. It takes the backup source and destination from the backup directory and restores the files to the original source location.

## Project Hierarchy


backup-restore-project/ ├── CMakeLists.txt  ├── README.md  ├── Makefile ├── backup.sh └── restore.sh ├── build/ # Directory for build artifacts │ └── ... # Build files generated by CMake 



- CMakeLists.txt: Contains the build instructions using CMake.
- Makefile: Contains the variables and the build commands.
- backup.sh: The Bash script that performs the backup operation.
- restore.sh: The Bash script that restores data from a backup.
- build/: Directory where the build files generated by CMake will be stored.

## Prerequisites

To run this project on Ubuntu, you need the following tools installed:

1. Bash: The scripts are written in Bash, which should be available on any Unix-based system.
2. CMake: Used for automating the build process. Install it by running:
   ```bash
   sudo apt-get install cmake
   sudo apt-get install build-essential

## Steps to Run the Project

Follow the steps below to set up and run the project:

### Clone the Repository and run the project

```bash
git clone <your-repo-url>
cd backup-restore-project/build
make backup
make restore
