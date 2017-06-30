# gICS #
The Consent Management solution [gICS](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/einwilligungsmanagement-gics.html) (generic Informed Consent Service) supports the management of digital informed consent documents. It facilitates checking  for various policies and modules of a consent in real time. 

### Tags
* ` tmfev/gics:2.5.5`,`latest` ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/master/gICS/2.5.5))
  - added: install MySQL5.7
  - added: mySQL-Skript to create database
  - added: wildfly to run gICS-Service and gICS-Webfrontend
  - tested with docker v1.10.3 and docker-compose v1.8.0
  - visit [Homepage of the MOSAIC-Project](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/einwilligungsmanagement-gics.html) for more information

### Run your Image
* get necessary files from github
  ```
  git clone https://github.com/tmfev/Dockerbank
  ```
* change to folder automatically created
  ```
  cd Dockerbank/gICS/2.5.5
  ```
* run docker-compose to pull and configure gICS
  ```
  sudo docker-compose up
  ```
* open browser and try out the gICS from http://YOURIPADDRESS:8080/gics-web/html/index.xhtml
