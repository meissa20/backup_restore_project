# Variables
BACKUP_DIR = /home/vboxuser/output
SRC = /home/vboxuser/src    # Specify the source directory
OUTPUT = $(BACKUP_DIR)   # Specify the output file for backup
BACKUP_SCRIPT = /home/vboxuser/project/backupd.sh
RESTORE_SCRIPT = /home/vboxuser/project/restore.sh
interval_secs = 3
max_backups= 3
# Default target
all: pre-build backup

# Pre-build step: create backup directory if it doesn't exist
pre-build:
	@mkdir -p $(BACKUP_DIR)
	@echo "Backup directory created or already exists: $(BACKUP_DIR)"

# Target to run the backup script with arguments
backup:
	@echo "Running backup script with arguments: $(SRC), $(OUTPUT), $(interval_secs), $(max_backups)"
	@bash $(BACKUP_SCRIPT) $(SRC) $(OUTPUT) $(interval_secs) $(max_backups)

# Target to run the restore script with arguments
restore:
	@echo "Running restore script with arguments: $(SRC), $(OUTPUT)"
	@bash $(RESTORE_SCRIPT) $(SRC) $(OUTPUT)
