#Para importar la imagen ubuntu, utilizamos FROM
FROM ubuntu:22.04:

#El creador y mantenedor de este Dockerfile
MAINTANER Ivan Melgar imelgar21@ilg.cat


#Actualizamos el sistema ubuntu con update y upgrade para aplicar actualización
RUN apt-get update  && apt-get -y upgrade
#Ahora instalamos el Python de la siguiente manera
RUN apt-get install -y python3.10
#Instalar Apache2
RUN apt-get install -y apache2
#Instalacion SSH
RUN apt-get install -y openssh-server
#Instalación mysql servidor base de datos
RUN apt-get install -y mysql-server


#Creacion de directorios para los servicios
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor


#Ahora se copiara el fichero de supervisor al directorio en Ubuntu
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


#Puertos a exponer Apache2:80,443, Supervisor:9001, SSH:22, Mysql:3306
EXPOSE 22 80 443 3306 9001

CMD ["/usr/bin/supervisord","-n"]
