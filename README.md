# GLPI-docker

This project is dockerization of the of the [GLPI](https://glpi-project.org/) project.

## Image building

To build images for this project use `build-publish.sh` script to do it for you. This scripts accepts `version` of the image as the argument.

If you intend to build use the script as shown.

`build-publish.sh 0.1`

You can also use *string* for the version `build-publish.sh version-12`. Modify the image name in the script as you intend.

Use additional `upload` argument to publish your image to docker hub.

```bash
./build-publish.sh v1.2 upload
```
Above command will prompt for your docker hub credentials, when correct credentials are provided, Image will be pushed to docker hub.

## Docker Repository
You can view information about this image on [Docker Hub](https://hub.docker.com/r/kraftsix/glpi).

## Setting up GLPI

Use the *.env* file to customize according to your requirements and use `docker compose` to start the containers.

- Use command `docker compose -f docker-compose.yml up -d`
- To view, what's happening in container use `docker compose -f docker-compose.yml logs` append `-f` to follow the logs.
- To stop the containers use `docker compose -f docker-compose.yml down`
- To inspect the containers in the network use `kraftsix-glpi_gnetwork`

Once all the containers are up and running use `http://localhost:8888` to access the portal. Follow the instructions to proceed

### Database setup
Use the following details to configure your database in the portal.

```YAML
Host: mariadb
User: glpiuser
Password: <REFER .env file>
Database: Either select the existing db or create new one
```

## Contribution
You are welcome to contribute to this repository, contributions are much appreciated.
- ***Contributors required***