# Pratilipi Demo
Main repo for pratilipi demo for the Microservices assignment

## Instructions
- This repo contains three submodules namely, content, user and user interaction. Use the command ```git clone --recurse-submodules <GIT_URL>``` to clone the repo including its submodules.
- Copy the env folder to the repo's root directory.
- The env folder contains ```.env``` files for both development and production environment following the **12-factor app** principle.
- The docker-compose files for production and development evironment are ```docker-compose.yml``` and ```docker-compose_dev.yml``` respectively.
- Run the commnad ```docker-compose up -d``` to build and run all the containers in production environment.
- In your localhost, the content, user and the user_interaction services are available at port 3000, 8000, and 5000 respectively
- The swagger and redoc pages for each of the services are available at ```/swagger``` and ```/redoc``` respectively. You can use
them to test the api or use the following Postman workspace for the same.  
[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/16666163-797abd7a-e24a-41e1-924b-86d8ef728bf5?action=collection%2Ffork&collection-url=entityId%3D16666163-797abd7a-e24a-41e1-924b-86d8ef728bf5%26entityType%3Dcollection%26workspaceId%3D182ae809-bc94-433f-bcf4-3d5a844532bc)
- Three test users are already seeded into the database, with ```user_id```, 1, 2, and 3.
- For the data ingestion of books content use the , you should upload a csv file having ```title```, ```story```, ```date_published``` and ```user_id``` fields.
The ```user_id``` entered into the file must be registered in the database, else the operation would fail.
- The data ingestion will be queued to the redis queue and will return ```job_id```. You can check its status via ```books/status``` using the ```job_id```.
- The content list api will be sorted by the user interaction which includes sorting by number of likes followed by number of reads. The books which don't have any interaction will be sorted by their primary key.

## Development and production environment
In development environment the service container uses ``host`` network mode to communicate with each other. 
Which means there is no distinction between container and localhost ports.
Whereas in production environment, the container talk to each other via the default ```bridge network``` created by the docker with their DNS being resolved by their service names.
```ALLOWED_HOSTS``` settings of Django is set according to network mode being used. If it is ```host``` mode, then ```localhost``` and ```127.0.0.1``` are listed else the name of the
services are listed which will be resolved by Docker at runtime. Same thing is followed for ```POSTGRES_HOST``` settings.
