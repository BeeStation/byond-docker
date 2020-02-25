# BeeStation BYOND Docker Image

There are two ways to use this Dockerfile. You can use our docker images hosted on the Docker Hub using the following methods:

```
# Stable release
FROM beestation/byond:latest
# Specific release version
FROM beestation/byond:<major>.<minor>
```

If there isn't a tag for the BYOND version you want to use, you can create a GitHub issue requesting that we add it. Alternatively, you can build a local image with a specified BYOND version using the `--build-arg` flags as shown below:

```
# Running the following command in the directory containing the Dockerfile will build a new image using version 513.1511 of BYOND.
docker build -t beestation/byond:custom --rm https://github.com/BeeStation/byond-docker.git --build-arg buildtime_BYOND_MAJOR=513 --build-arg buildtime_BYOND_MINOR=1511

# -t beestation/byond:custom | This is the label for your image
# --build-arg buildtime_BYOND_MAJOR= | Both this and the MINOR build arguments are required to use a custom version.
```
