# gPAS #
The [gPAS](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/pseudonymverwaltung-gpas.html) (generic Pseudonym Administration Service) generates and administers appropriate pseudonyms using non-deterministic pseudonyms for arbitrary alphanumeric sequences. Additionally it allows defining domain-specific alphabets and generator algorithms as required and offers functions for de-pseudonymisation and anonymisation.

### Tags
* ` tmfev/gPAS:1.7.10`,`latest` ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/master/gPAS/1.7.10))
  - from: mosaicgreifswald/wildfly:10.1.0.Final-20170418
  - updated: gPAS v1.7.8 to v1.7.10
  - tested with docker v17.04.0 and docker-compose v1.12.0
* ` tmfev/gPAS:1.7.8` ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/master/gPAS/1.7.8))
  - added: install MySQL5.7
  - added: mySQL-Skript to create database
  - added: wildfly to run gPAS-Service and gPAS-Webfrontend
  - tested with docker v1.10.3 and docker-compose v1.8.0

### Run your Image
* get necessary files from github
  ```
  git clone https://github.com/tmfev/Dockerbank
  ```
* change to folder automatically created
  ```
  cd Dockerbank/gPAS/1.7.10
  ```
* run docker-compose to pull and configure gPAS
  ```
  sudo docker-compose up
  ```
* open browser and try out the gPAS from http://YOURIPADDRESS:8080/gpas-web/html/index.xhtml
