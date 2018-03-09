# Documentation site generator

**Docs** serves the source{d} documentation sites using our common global service [docsrv](https://github.com/src-d/docsrv)

To do so, all projects being served by docs need to follow the rules given by [_tutorials](_tutorials)

## Launch it locally with docker

You can launch a docsrv container instance with the prod configuration running:
```shell
make develop-run;
```
And then go to a project site:

[http://project-host-name:9090](http://project-host-name:9090)


## For development purposes

It can be generated &ndash;and served&ndash; a _landing-like site_, containing the documentation for a project located under `<sources_path>`, running:

```shell
cd <sources_path>;

# Env vars that would be defined by docsrv if it would be ran through that service
export HOST_NAME=<hostname>;
export VERSION_NAME=<version>;

# The following will generate and will serve the documentation site under http://<hostname>:8585
SERVE=true make docs;
```

where:
- **sources_path**: absolute path to the project which documentation will be generated
- **hostname**: hostname under the docs will be served. It must match the `project.hostname` as defined in [data/categories.yml](../hugo/data/categories.yml)
- **version**: version of the project as being in `sources_path`

### example:

To serve the go-git documentation you need to have:
- the go-git repo downloaded under `$GOSRC/gopkg.in/src-d/go-git.v4`,
- an entry in the `/etc/hosts` like the following:<br />
```127.0.0.1    go-git.sourced.tech```

```shell
cd $GOSRC/gopkg.in/src-d/go-git.v4;

export HOST_NAME=go-git.sourced.tech;
export VERSION_NAME=v.4;

SERVE=true make docs-site-serve;
```
and go to http://go-git.sourced.tech:8585


## Deploy

The project is not integrated with the CI/CD system, so it must be built and deployed manually:

```shell
login=<your_docker_registry_login>
repo_host=quay.io
repo_url=${repo_host}/srcd/docs
tag=`git rev-parse --short HEAD`
repo_url_tag=${repo_url}:${tag}
repo_url_latest=${repo_url}:latest

make build &&
docker build -t ${repo_url_tag} . &&
docker tag ${repo_url_tag} ${repo_url_latest} &&
docker login ${repo_host} --username ${login} &&
docker push ${repo_url_tag} &&
docker push ${repo_url_latest}
```
