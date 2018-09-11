# gICS v.2.8.5
A Generic Informed Consent Service

The Consent Management solution gICS supports the management of digital and paper-based informed consent documents. It facilitates checking for various policies and modules of a consent in real time.

![context](https://user-images.githubusercontent.com/22166209/42631209-c1a9e236-85d9-11e8-94e8-74b5022a2f43.PNG)

# License
This Software was developed by the Institute for Community Medicine of the University Medicine Greifswald. It it licensed under AGPLv3 and initially provided by the DFG-funded MOSAIC-Project (grant number HO 1937/2-1).

### Tags
* ` tmfev/gics:2.8.5`,`latest` ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/master/gICS/2.8.5))
   - from: mosaicgreifswald/wildfly:12.0.0.Final
   - updated: gICS 2.5.5 to 2.8.5

* ` tmfev/gics:2.5.5`,`latest` ([Docker-Compose File and SQLs](https://github.com/tmfev/Dockerbank/tree/master/gICS/2.5.5))
  - added: install MySQL5.7
  - added: mySQL-Skript to create database
  - added: wildfly to run gICS-Service and gICS-Webfrontend
  - tested with docker v1.10.3 and docker-compose v1.8.0
  
### Run your Image
* get necessary files from github
  ```
  git clone https://github.com/tmfev/Dockerbank
  ```
* change to folder automatically created
  ```
  cd Dockerbank/gICS/2.8.5
  ```
* run docker-compose to pull and configure gICS
  ```
  sudo docker-compose up
  ```
* open browser and try out the gICS from http://YOURIPADDRESS:8080/gics-web/html/index.xhtml

# More Information
Concept and implementation: l.geidel, web client: a.blumentritt, m.bialke

Selected functionalities of gICS were developed as part of the MAGIC Project (funded by the DFG HO 1937/5-1).

Please cite our publications: 
http://dx.doi.org/10.3414/ME14-01-0133, 
http://dx.doi.org/10.1186/s12967-015-0545-6, 
http://dx.doi.org/10.3205/17gmds146

For more info visit https://mosaic-greifswald.de/werkzeuge-und-vorlagen/einwilligungsmanagement-gics.html
