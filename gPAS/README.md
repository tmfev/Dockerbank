# gPAS #
The [gPAS](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/pseudonymverwaltung-gpas.html) (generic Pseudonym Administration Service) generates and administers appropriate pseudonyms using non-deterministic pseudonyms for arbitrary alphanumeric sequences. Additionally it allows defining domain-specific alphabets and generator algorithms as required and offers functions for de-pseudonymisation and anonymisation.

### Tags
* ` tmfev/gPAS:1.7.8`,`latest` ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/mosaic-hgw-patch-1/gPAS/1.7.8))
  - added: install MySQL5.7
  - added: mySQL-Skript to create database
  - added: wildfly to run gPAS-Service and gPAS-Webfrontend
  - tested with docker v1.10.3 and docker-compose v1.8.0
  - visit [MOSAIC-Homepage](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/pseudonymverwaltung-gpas.html) for more information

### Run your Image
* get necessary files from github
  ```sh
  git clone https://github.com/tmfev/Dockerbank
  ```
* change to folder automatically created
  ```sh  
  cd Dockerbank/gPAS
  ```
* run docker-compose to pull and configure gPAS
  ```sh
  sudo docker-compose up
  ```
* open browser and try out the gPAS from http://YOURIPADDRESS:8080/gpas-web/html/index.xhtml
