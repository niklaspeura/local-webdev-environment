#!/bin/bash 

terminate() { 
	echo "Caught SIGTERM or SIGINT signal!"
	if [ -f /opt/mysql_backups/dump.sql ]; then
		echo "Removing old backup"
		rm /opt/mysql_backups/dump.sql
	fi
	echo "Creating new mysqldump backup"
	mysqldump -p"$MYSQL_ROOT_PASSWORD" --all-databases > /opt/mysql_backups/dump.sql
	sleep 1
	echo "Exiting gracefully"
}

trap terminate SIGTERM SIGINT

echo "Arguments passed: $($@)"
echo "-----------------------------------"
echo "Environment variables:"
env
echo "-----------------------------------"
echo "Preparing mysql backup";
	if [ -f /opt/mysql_backups/dump.sql ]; then
		echo "File found, preparing..."
		cp /opt/mysql_backups/dump.sql /docker-entrypoint-initdb.d/
	else
		echo "Backup file not found, skipping..."
	fi
echo "Starting mysql server";
/entrypoint.sh "$@" &
child=$! 
echo "Default image entrypoint script pid = ${child}"

wait "${child}"