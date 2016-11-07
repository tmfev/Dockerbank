# MOSAIC-THS-Tools #

### Tags
* ` tmfev/mosaic-ths-tools:20161107`,`latest` ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/master/MOSAIC-THS-Tools/20161107))
  - added: install MySQL5.7
  - added: mySQL-Skript to create database
  - added: wildfly to run Servicea and Webfrontends for:
    - E-PIX v2.4.0 ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/master/E-PIX/2.4.0), [MOSAIC-Homepage](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/id-management-e-pix.html))
    - gICS v2.5.5 ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/master/gICS/2.5.5), [MOSAIC-Homepage](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/einwilligungsmanagement-gics.html))
    - gPAS v1.7.8 ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/master/gPAS/1.7.8), [MOSAIC-Homepage](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/pseudonymverwaltung-gpas.html))
  - tested with docker v1.10.3 and docker-compose v1.8.0

### Run your Image
* get necessary files from github
  ```
  git clone https://github.com/tmfev/Dockerbank
  ```
* change to folder automatically created
  ```
  cd Dockerbank/MOSAIC-THS-Tools
  ```
* run docker-compose to pull and configure MOSAIC-THS-Tools
  ```
  sudo docker-compose up
  ```
* open browser and try out:
  - E-PIX from http://YOURIPADDRESS:8080/epix-web/html/index.xhtml
  - gICS from http://YOURIPADDRESS:8080/gics-web/html/index.xhtml
  - gPAS from http://YOURIPADDRESS:8080/gpas-web/html/index.xhtml
