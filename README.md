# docker-guacamole

# About
![Guacamole](https://github.com/tunip/docker-guacamole/raw/master/guacamole.png)

Guacamole client (HTML5 web application) based on Debian.

# Volumes
|Local|Container|Description|
|:--|:--|:--|
|/your path/guacamole/config|/config|Guacamole configuration files|

# Guacamole configuration examples
*guacamole.properties*
```
guacd-hostname: <your guacd ip>
guacd-port:     4822
available-languages: en, de
enable-clipboard-integration: true
```
guacd-hostname is your Guacamole server (guacd host).

*user-mapping.xml*
```
<user-mapping>
    <authorize username="abc" password="342534h34hkj32452345bnb3452345" encoding="md5">
        <connection name="Windows RDP">
            <protocol>rdp</protocol>
            <param name="hostname">192.168.1.14</param>
            <param name="color-depth">16</param>
            <param name="disable-audio">true</param>
            <param name="security">tls</param>
            <param name="ignore-cert">true</param>
            <param name="enable-drive">true</param>
            <param name="drive-path">/config</param>
        </connection>
        <connection name="Linux SSH">
            <protocol>ssh</protocol>
            <param name="hostname">192.168.1.15</param>
            <param name="font-size">12</param>
            <param name="font-name">Terminus</param>
            <param name="enable-sftp">true</param>
        </connection>
    </authorize>
</user-mapping>
```
If you want a simple Guacamole setup wihout a SQL database, create a user-mapping.xml configuration file.

# Usage
```
docker run -d --name="guacamole" \
    -v /your path/guacamole/config:/config \
    -p 8080:8080 \
    tunip/guacamole
```
# Web UI
`http://<your ip>:8080/guacamole/`