# directory-permission-setter

This docker image is supposed is created to allow setting owners of a directory through docker compose and kubernetes.
Different linux distributions have different default user IDs, therefore files being accessed through docker images need to be set to the user ID from these docker images (in our case mainly for logging).

## Usage

To use this docker image, simply run it before starting the desired docker image.
The only thing that needs to be set is the environment value `DIRECTORIES_TO_SET`.
Only accepted values are space separated absolute file paths.

Example from docker compose:
```yaml
  initialize-log-folders:
    image: directory-permission-setter:latest
    restart: "no"
    volumes:
      - ./docker_volumes:/docker_volumes
    environment:
      DIRECTORIES_TO_SET: >-
        /docker_volumes/module-gateway
        /docker_volumes/external-server
        /docker_volumes/virtual-vehicle-utility
        /docker_volumes/virtual-plc
        /docker_volumes/integration-layer
        /docker_volumes/http-api
        /docker_volumes/management-api
```
