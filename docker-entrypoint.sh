#!/bin/bash
set -e

# Set UID/GID
PUID=${PUID:-911}
PGID=${PGID:-911}

# Set permissions
groupmod -o -g "$PGID" abc
usermod -o -u "$PUID" abc
chown -R abc:abc /var/lib/tomcat8 /etc/tomcat8 /var/log/tomcat8 /var/cache/tomcat8

export CATALINA_HOME=/usr/share/tomcat8
export CATALINA_BASE=/var/lib/tomcat8
export CATALINA_TMPDIR=/tmp

gosu abc /usr/share/tomcat8/bin/catalina.sh run