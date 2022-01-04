#!/bin/sh

echo "###########################################################################"
echo "#Escrito por Saulo Quintal                                                #"
echo "#Script escrito para processo de restore automatizado do issabel no bacula#"
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

###Destino do backup###
DIR_BKP=/home/backup/issabel

echo "Iniciando processo de restore."
echo "---------------------------------------------------------------------------"

ARQ=`find $DIR_BKP -type f -printf '%T+ %p\n' | sort | cut -d/ -f5 | head -n 1`

systemctl stop asterisk.service

systemctl stop httpd.service

sudo tar -zxf $DIR_BKP/$ARQ -C /

sudo gunzip < $DIR_BKP/$DBNAME-db.sql.gz | sudo mysql -u$DBUSER  -p$DBPASS $DBNAME

sudo gunzip < $DIR_BKP/$DBNAME1-db.sql.gz | sudo mysql -u$DBUSER  -p$DBPASS $DBNAME1

sudo gunzip < $DIR_BKP/$DBNAME2-db.sql.gz | sudo mysql -u$DBUSER  -p$DBPASS $DBNAME2

sudo gunzip < $DIR_BKP/$DBNAME3-db.sql.gz | sudo mysql -u$DBUSER  -p$DBPASS $DBNAME3

sudo gunzip < $DIR_BKP/$DBNAME4-db.sql.gz | sudo mysql -u$DBUSER  -p$DBPASS $DBNAME4

sudo gunzip < $DIR_BKP/$DBNAME5-db.sql.gz | sudo mysql -u$DBUSER  -p$DBPASS $DBNAME5

sudo tar -zxf $DIR_BKP/var-lib-asterisk-agi-bin.tar.gz -C /

sudo tar -zxf $DIR_BKP/var-lib-asterisk-moh.tar.gz -C /

sudo tar -zxf $DIR_BKP/var-lib-asterisk-mohmp3.tar.gz -C /

sudo tar -zxf $DIR_BKP/var-lib-asterisk-sounds-custom.tar.gz -C /

sudo tar -zxf $DIR_BKP/var-spool-imap.tar.gz -C /

sudo tar -zxf $DIR_BKP/var-www.tar.gz -C /

sudo tar -zxf $DIR_BKP/etc-asterisk.tar.gz -C /

sudo tar -zxf $DIR_BKP/etc-dahdi.tar.gz -C /

#sudo tar -zxf $DIR_BKP/tftpboot.tar.gz -C /

sudo rm -rf $DIR_BKP/$DBNAME-db.sql.gz

sudo rm -rf $DIR_BKP/$DBNAME1-db.sql.gz

sudo rm -rf $DIR_BKP/$DBNAME2-db.sql.gz

sudo rm -rf $DIR_BKP/$DBNAME3-db.sql.gz

sudo rm -rf $DIR_BKP/$DBNAME4-db.sql.gz

sudo rm -rf $DIR_BKP/$DBNAME5-db.sql.gz

sudo rm -rf $DIR_BKP/var-lib-asterisk-agi-bin.tar.gz

sudo rm -rf $DIR_BKP/var-lib-asterisk-moh.tar.gz

sudo rm -rf $DIR_BKP/var-lib-asterisk-mohmp3.tar.gz

sudo rm -rf $DIR_BKP/var-lib-asterisk-sounds-custom.tar.gz

sudo rm -rf $DIR_BKP/var-spool-imap.tar.gz

sudo rm -rf $DIR_BKP/var-www.tar.gz

sudo rm -rf $DIR_BKP/etc-asterisk.tar.gz

sudo rm -rf $DIR_BKP/etc-dahdi.tar.gz

sudo rm -rf $DIR_BKP/tftpboot.tar.gz

systemctl start asterisk.service

systemctl start httpd.service

echo "---------------------------------"
echo "-PROCESSO DE RESTORE FINALIZADO!-"
echo "---------------------------------"
 
