# build-environment-scripts
Scripts for standardized build environment

## Docker

Docker images, that are used as base for the BringAuto project's images.

Contains two scripts for building and pushing the images.

### build_docker.sh

Builds and tags a docker image from the Dockerfile located in the directory with the same name as the image.

Usage:
```bash
    ./build_docker.sh <image_name>
```

### push_docker.sh

Pushes a docker image to the BringAuto DockerHub registry. User has to be logged in and authorized to push images.

Usage:
```bash
    ./push_docker.sh <image_name>
```