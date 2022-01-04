#!/bin/sh

echo "###########################################################################"
echo "#Escrito por Saulo Quintal                                                #"
echo "#Script escrito para processo de backup automatizado do issabel no bacula.#"
echo "#Script livre para reprodução e alteração.                                #"
echo "#Contato: sauloquintal@gmail.com                                          #"
echo "###########################################################################"
echo "---------------------------------------------------------------------------"

###Usuario e senha do mysql###
DBUSER=USER
DBPASS=PASSWORD

###Banco de dados em sequenia###
DBNAME=asterisk
DBNAME1=call_center
DBNAME2=endpointconfig
DBNAME3=meetme
DBNAME4=mysql
DBNAME5=roundcubedb

###Diretorios do Issabel###
BK_ORIGEM=/var/lib/asterisk/agi-bin/
BK_ORIGEM1=/var/lib/asterisk/moh/
BK_ORIGEM2=/var/lib/asterisk/mohmp3/
BK_ORIGEM3=/var/lib/asterisk/sounds/custom/
BK_ORIGEM4=/var/spool/imap/
BK_ORIGEM5=/var/www/
BK_ORIGEM6=/etc/asterisk/
BK_ORIGEM7=/etc/dahdi/
BK_ORIGEM8=/tftpboot/

###Destino do backup###
BK_DEST=/home/backup/issabel

echo "Iniciando processo de backup."
echo "---------------------------------------------------------------------------"

#Backup do banco de dados completo asterisk
sudo mysqldump -u$DBUSER -p"$DBPASS" "$DBNAME" | /bin/gzip > "$BK_DEST/$DBNAME-db.sql.gz"

echo "Processo de backup do banco de dados $DBNAME realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup do banco de dados completo call_center
sudo mysqldump -u$DBUSER -p"$DBPASS" "$DBNAME1" | /bin/gzip > "$BK_DEST/$DBNAME1-db.sql.gz"

echo "Processo de backup do banco de dados $DBNAME1 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup do banco de dados completo endpointconfig
sudo mysqldump -u$DBUSER -p"$DBPASS" "$DBNAME2" | /bin/gzip > "$BK_DEST/$DBNAME2-db.sql.gz"

echo "Processo de backup do banco de dados $DBNAME2 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup do banco de dados completo meetme
sudo mysqldump -u$DBUSER -p"$DBPASS" "$DBNAME3" | /bin/gzip > "$BK_DEST/$DBNAME3-db.sql.gz"

echo "Processo de backup do banco de dados $DBNAME3 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup do banco de dados completo mysql
sudo mysqldump -u$DBUSER -p"$DBPASS" "$DBNAME4" | /bin/gzip > "$BK_DEST/$DBNAME4-db.sql.gz"

echo "Processo de backup do banco de dados $DBNAME4 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup do banco de dados completo roundcubedb
sudo mysqldump -u$DBUSER -p"$DBPASS" "$DBNAME5" | /bin/gzip > "$BK_DEST/$DBNAME5-db.sql.gz"

echo "Processo de backup do banco de dados $DBNAME5 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup diretorio /var/lib/asterisk/agi-bin/
sudo tar -czf $BK_DEST/var-lib-asterisk-agi-bin.tar.gz $BK_ORIGEM

echo "Backup do diretorio $BK_ORIGEM realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup diretorio /var/lib/asterisk/moh/
sudo tar -czf $BK_DEST/var-lib-asterisk-moh.tar.gz $BK_ORIGEM1

echo "Backup do diretorio $BK_ORIGEM1 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup diretorio /var/lib/asterisk/mohmp3/
sudo tar -czf $BK_DEST/var-lib-asterisk-mohmp3.tar.gz $BK_ORIGEM2

echo "Backup do diretorio $BK_ORIGEM2 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup diretorio /var/lib/asterisk/sounds/custom/
sudo tar -czf $BK_DEST/var-lib-asterisk-sounds-custom.tar.gz $BK_ORIGEM3

echo "Backup do diretorio $BK_ORIGEM3 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup diretorio /var/spool/imap/
sudo tar -czf $BK_DEST/var-spool-imap.tar.gz $BK_ORIGEM4

echo "Backup do diretorio $BK_ORIGEM4 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup diretorio /var/www/
sudo tar -czf $BK_DEST/var-www.tar.gz $BK_ORIGEM5

echo "Backup do diretorio $BK_ORIGEM5 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup diretorio /etc/asterisk/
sudo tar -czf $BK_DEST/etc-asterisk.tar.gz $BK_ORIGEM6

echo "Backup do diretorio $BK_ORIGEM6 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup diretorio /etc/dahdi/
sudo tar -czf $BK_DEST/etc-dahdi.tar.gz $BK_ORIGEM7

echo "Backup do diretorio $BK_ORIGEM7 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

#Backup diretorio /tftpboot/
sudo tar -czf $BK_DEST/tftpboot.tar.gz $BK_ORIGEM8

echo "Backup do diretorio $BK_ORIGEM8 realizado com sucesso!"
echo "---------------------------------------------------------------------------"

sudo tar -cf $BK_DEST/backup-issabelPBX`date +%Y-%m-%d`.tar.gz $BK_DEST/$DBNAME-db.sql.gz $BK_DEST/$DBNAME1-db.sql.gz $BK_DEST/$DBNAME2-db.sql.gz $BK_DEST/$DBNAME3-db.sql.gz $BK_DEST/$DBNAME4-db.sql.gz $BK_DEST/$DBNAME5-db.sql.gz $BK_DEST/var-lib-asterisk-agi-bin.tar.gz $BK_DEST/var-lib-asterisk-moh.tar.gz $BK_DEST/var-lib-asterisk-mohmp3.tar.gz $BK_DEST/var-lib-asterisk-sounds-custom.tar.gz $BK_DEST/var-spool-imap.tar.gz $BK_DEST/var-www.tar.gz $BK_DEST/etc-asterisk.tar.gz $BK_DEST/etc-dahdi.tar.gz $BK_DEST/tftpboot.tar.gz

sudo rm -rf $BK_DEST/$DBNAME-db.sql.gz

sudo rm -rf $BK_DEST/$DBNAME1-db.sql.gz

sudo rm -rf $BK_DEST/$DBNAME2-db.sql.gz

sudo rm -rf $BK_DEST/$DBNAME3-db.sql.gz

sudo rm -rf $BK_DEST/$DBNAME4-db.sql.gz

sudo rm -rf $BK_DEST/$DBNAME5-db.sql.gz

sudo rm -rf $BK_DEST/var-lib-asterisk-agi-bin.tar.gz

sudo rm -rf $BK_DEST/var-lib-asterisk-moh.tar.gz

sudo rm -rf $BK_DEST/var-lib-asterisk-mohmp3.tar.gz

sudo rm -rf $BK_DEST/var-lib-asterisk-sounds-custom.tar.gz

sudo rm -rf $BK_DEST/var-spool-imap.tar.gz

sudo rm -rf $BK_DEST/var-www.tar.gz

sudo rm -rf $BK_DEST/etc-asterisk.tar.gz

sudo rm -rf $BK_DEST/etc-dahdi.tar.gz

sudo rm -rf $BK_DEST/tftpboot.tar.gz

echo "--------------------------------"
echo "-PROCESSO DE BACKUP FINALIZADO!-"
echo "--------------------------------"

