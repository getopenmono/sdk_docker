# OpenMono SDK Docker Image

[![Docker Build Statu](https://img.shields.io/docker/build/monolit/sdk.svg)](https://hub.docker.com/r/monolit/sdk) [![Docker Automated buil](https://img.shields.io/docker/automated/monolit/sdk.svg)](https://hub.docker.com/r/monolit/sdk)

**This is a Docker image to build *OpenMono applications. Can be used for _Continous Integration_ or alike.*

### Usage

To compile a mono app with this container, to must mount the repo dir inside the container and point a environment variable to the mount point.

Say we have our app code checkout at `/mycode`, then to compile the code with Docker use this:

```
$ docker run -tie APP_DIR=/mycode -v /mycode:/mycode
```

This will mount /mycode inside the container, and the containerøs `CMD` script will know ehere it is using the `APP_DIR` variable.