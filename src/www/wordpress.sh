#!/bin/bash 

echo "Starting apache server";
docker-php-entrypoint "$@" &
child=$! 
echo "Default image entrypoint script pid = ${child}"

#seconds=${INIT_TIMEOUT}
#echo "Waiting ${seconds} seconds for /var/www/html directory to be created..."
#while [ ${seconds} != 0 ] && [ ! -d /var/www/html ]; do
#	sleep 1
#	seconds=$((seconds - 1))
#	if (( ${seconds} % 5 == 0 )); then
#		echo "Waiting ${seconds} more seconds..."
#		echo $(ls -1)
#		pwd
#	fi
#done
#
#if [ ! -d /var/www/html ]; then
#	echo "Aborting..."
#	exit 1
#fi


if [ -z "$(ls -A /var/www/html)" ]; then
	echo "/var/www/html directory is empty, getting latest wordpress package"
	tmp=$(date +%s)
	echo "Creating temporary directory /var/www/${tmp}"
	mkdir /var/www/${tmp}
	echo "Downloading latest worpress release"
	curl https://wordpress.org/latest.tar.gz > /var/www/${tmp}/latest.tar.gz
	echo "Extracting tar in /var/www/${tmp}"
	tar xfz /var/www/${tmp}/latest.tar.gz --directory /var/www/${tmp}
	echo "Moving files from /var/www/${tmp}/wordpress to /var/www/html"
	(cd /var/www/${tmp}/wordpress && tar c .) | (cd /var/www/html && tar xf -)
	echo "Removing temp directory /var/www/${tmp}"
	rm -Rf /var/www/${tmp}
	echo "Done!"
else
	echo "html directory is already populated"
	echo "Nothing to do..."
fi

wait "${child}"