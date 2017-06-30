# MOSAIC-THS-Tools #

### Tags
* ` tmfev/mosaic-ths-tools:1.0`,`latest` ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/master/MOSAIC-THS-Tools/1.0))
  - added: install MySQL5.7
  - added: mySQL-Skript to create database
  - added: wildfly to run Servicea and Webfrontends for:
    - E-PIX v2.4.0 ([Homepage of the MOSAIC-Project](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/id-management-e-pix.html))
    - gICS v2.5.5 ([Homepage of the MOSAIC-Project](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/einwilligungsmanagement-gics.html))
    - gPAS v1.7.8 ([Homepage of the MOSAIC-Project](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/pseudonymverwaltung-gpas.html))
  - tested with docker v1.10.3 and docker-compose v1.8.0

### Run your Image
* get necessary files from github
  ```
  git clone https://github.com/tmfev/Dockerbank
  ```
* change to folder automatically created
  ```
  cd Dockerbank/MOSAIC-Project-THS-Tools/1.0
  ```
* run docker-compose to pull and configure MOSAIC-THS-Tools
  ```
  sudo docker-compose up
  ```
* open browser and try out:
  - E-PIX from http://YOURIPADDRESS:8080/epix-web/html/index.xhtml
  - gICS from http://YOURIPADDRESS:8080/gics-web/html/index.xhtml
  - gPAS from http://YOURIPADDRESS:8080/gpas-web/html/index.xhtml
