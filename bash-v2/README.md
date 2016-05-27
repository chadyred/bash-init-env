Sur la base du script  et de la machine de base "DevBox.ova" fournis,
vous créerez un nouveau script .sh permettant, de manière automatisée, de :

// créer un utilisateur « webmaster » avec un mot de passe généré aléatoirement
// créer un utilisateur MySQL « wp » avec un mot de passe généré aléatoirement
// créer une base de donnée MySQL "wp", donner à l’utilisateur "wp" les droits complets sur cette base

//Installer un wordpress fonctionnel dans /var/www/project, hébergé sur un Vhost apache //répondant à l’adresse www.project.localdomain et utilisant la base de données « project » 

// Installer WCLI

// Installer les outils de sécurité indispensables : 
fail2ban
logwatch
rkhunter

Installer un script, lancé automatiquement en crontab toute les nuits à 3h00, qui :

//effectuera un dump de la base de données "wp" et le placera dans /var/www/project
//effectuera une copie archivée et compressée (tar.gz) du répertoire /var/www/project et la placera dans le répertoire /home/webmaster
Vous enverrez ce script en PJ par retour d’email.

Bon courage ! 