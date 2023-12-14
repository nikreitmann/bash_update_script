# bash_update_script
A simple bash script for auto update using apt

## Description
I suggest doing a cronjob for this script, or you can run it manually.

The following can be defined in the script:
- log file path
- apt packages exceptions

The log file is overwritten with each run.

## Usage
Create a cron job using ```crontab -e```
Example:
```0 4 1 * * bash /root/update.sh ```
