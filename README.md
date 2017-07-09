# Docker Pipeline Example

This repository shows the procedure for developing docker images within gitlab.
Once the image has been developed it will be released to github and docker hub.

## Build & Release Status

### Build

[![Build Status](https://travis-ci.org/sjcp-solutions/docker-pipeline.svg?branch=master)](https://travis-ci.org/sjcp-solutions/docker-pipeline)
[![GitHub tag](https://img.shields.io/github/tag/sjcp-solutions/docker-pipeline.svg)](https://github.com/sjcp-solutions/docker-pipeline/releases)
[![license](https://img.shields.io/github/license/sjcp-solutions/docker-pipeline.svg)](https://github.com/sjcp-solutions/docker-pipeline/blob/master/LICENCE)

### Release

[![Docker Build Statu](https://img.shields.io/docker/build/sjcp/docker-pipeline.svg)](https://hub.docker.com/r/sjcp/docker-pipeline/)
[![Docker Automated buil](https://img.shields.io/docker/automated/sjcp/docker-pipeline.svg)](https://hub.docker.com/r/sjcp/docker-pipeline/)
[![Docker Pulls](https://img.shields.io/docker/pulls/sjcp/docker-pipeline.svg)](https://hub.docker.com/r/sjcp/docker-pipeline/)
[![Docker Stars](https://img.shields.io/docker/stars/sjcp/docker-pipeline.svg)](https://hub.docker.com/r/sjcp/docker-pipeline/)

## Gitlab Development

### Gitlab General Settings

* Merge Requests: *Fast-forward merge*
* Only allow merge requests to be merged if the pipeline succeeds

### Gitlab Repository Settings

#### Push Rule

Set the following rules:

* Do not allow users to remove git tags with git push
* Prevent committing secrets to Git
* Branch name: `(master|develop|feature|release)\/*`
* Commit author's email: `@sjcp-solutions.com$`

## GitHub Deployment

### Github Repository

* Create a GitHub repository mirroring the same name as the Gitlab repo.
* Create a personal token on GitHub allowing the user to push to the repository.
* Add the personal token as a protected environment variable for the pipeline called `GITHUB_TOKEN`
* Goto *Travis-ci.org* and link the repository allowing for CI
* Set the settings to only build if `.travis.yml` is present

### Dockerhub Release

* Create an automated-build within docker hub
* Link the dockerhub repository and the github repository
* Add build step: `TAG`, `/^[0-9.]+$/`, `/`, `latest`
* Add build step: `TAG`, `/^[0-9.]+$/`, `/`
* Uncheck automatic build on push
* Activate triggers
* Store the trigger token in an environment variable within travis ci
* Add triger url to build file