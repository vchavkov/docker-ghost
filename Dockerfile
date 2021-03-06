# Ghost Docker image.
# Ghost is a simple, powerful publishing platform.
#
# Ghost version: 0.7.5
#
FROM ghost:latest

MAINTAINER Alexander Holbreich http//alexander.holbreich.org

# Add in better default config 
ADD config.example.js config.example.js
ADD backup.sh /
# Fix permisions for backup script
RUN chmod a+x /backup.sh 

# Fix ownership in src
RUN chown -R user $GHOST_SOURCE/content

#volume for backupscripts
VOLUME /backups

# Default environment variables
ENV GHOST_URL http://localhost
ENV PROD_FORCE_ADMIN_SSL true