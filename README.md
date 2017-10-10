# Docummentation site generator

It can be generated &ndash;and served&ndash; a _landing-like site_, containing the documentation for a project located under `<sources_path>`, running:

```
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

## example:

To serve the go-git documentation you need to have:
- the go-git repo downloaded under `$GOSRC/gopkg.in/src-d/go-git.v4`,
- an entry in the `/etc/hosts` like the following:<br />
```127.0.0.1    go-git.sourced.tech```

```
cd $GOSRC/gopkg.in/src-d/go-git.v4;

export HOST_NAME=go-git.sourced.tech;
export VERSION_NAME=v.4;

SERVE=true make docs-site-serve;
```
and go to http://go-git.sourced.tech:8585
