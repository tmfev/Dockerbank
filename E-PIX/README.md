# E-PIX #
The ID Management solution [E-PIX](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/id-management-e-pix.html) (Enterprise Identifier Cross Referencing) applies the Fellegi-Sunter-algorithm and the Levenshtein distance to avoid duplicate participant entries. The independent software module facilitates participant management and multisite-aggregation of medical research data. Additionally, the correction of potential synonym errors is supported (i.e. false-negative record linkage).

### Tags
* ` tmfev/epix:2.4.0`,`latest` ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/mosaic-hgw-patch-1/E-PIX/2.4.0))
  - added: install MySQL5.7
  - added: mySQL-Skript to create database
  - added: wildfly to run E-PIX-service and E-PIX-Webfrontend
  - tested with docker v1.10.3 and docker-compose v1.8.0
  - visit [MOSAIC-Homepage](https://mosaic-greifswald.de/werkzeuge-und-vorlagen/id-management-e-pix.html) for more information

### Run your Image
* get necessary files from github
  ```
  git clone https://github.com/tmfev/Dockerbank
  ```
* change to folder automatically created
  ```
  cd Dockerbank/E-PIX
  ```
* run docker-compose to pull and configure E-PIX
  ```
  sudo docker-compose up
  ```
* open browser and try out the E-PIX from http://YOURIPADDRESS:8080/epix-web/html/index.xhtml
