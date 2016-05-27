echo "Backup de la base de donnée et du projet"
echo "----------------------------------------"

${cmdProxy} mysqldump -u root wp > /var/www/project/wp_backup.sql

${cmdProxy}  tar zcvf /home/webmaster/backup-wp-project-$(date +%Y-%m-%d).tar.gz /var/www/project