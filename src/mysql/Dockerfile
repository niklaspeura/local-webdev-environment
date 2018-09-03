FROM mysql:8.0
RUN mkdir -p /opt/mysql_backups
COPY db/ /opt/mysql_backups/
COPY run_mysql.sh /usr/local/bin/
ENTRYPOINT ["run_mysql.sh"]
CMD ["mysqld"]
EXPOSE 3306