# ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️

Don't use me anymore, there's now an official [Docker image to run ReDoc CLI](https://github.com/Redocly/redoc/pkgs/container/redoc%2Fcli).

To migrate, replace:

```
docker run --rm -v $PWD:/src -w /src multani/redoc-cli bundle openapi-demo.yaml -o index.html
```

by:

```
docker run --rm -v $PWD:/src -w /src ghcr.io/redocly/redoc/cli:v2.0.0-rc.58 bundle openapi-demo.yaml -o index.html
```

Or any other more recent image that you can find on https://github.com/Redocly/redoc/pkgs/container/redoc%2Fcli.


---

# `redoc-cli` as a container

This provides the [ReDoc CLI's `redoc-cli`](https://www.npmjs.com/package/redoc-cli) as a Docker image.


## How to use?

* Just run a new container, providing the OpenAPI specification file:

  ```
  docker run --rm -v $PWD:/src -w /src multani/redoc-cli bundle openapi-demo.yaml -o index.html
  ```

* You can see the changes on the documentation live with:

  ```
  docker run --name redoc --rm -v $PWD:/src -w /src -p 8080:8080 multani/redoc-cli serve -w openapi-demo.yaml
  ```

  Then open: http://localhost:8080

* For those using Jenkins, use:

  ```groovy
  docker.image('multani/redoc-cli').inside {
    sh 'redoc-cli bundle openapi-demo.yaml -o index.html'
  }
  ```


For more information, run:

```
$ docker run --rm multani/redoc-cli --version
0.10.4
$ docker run --rm multani/redoc-cli --help
redoc-cli <command>

Commands:
  redoc-cli serve <spec>   start the server
  redoc-cli bundle <spec>  bundle spec into zero-dependency HTML-file

Options:
  --help             Show help                                         [boolean]
  --version          Show version number                               [boolean]
  -t, --template     Path to handlebars page template, see https://git.io/vh8fP
                     for the example                                    [string]
  --templateOptions  Additional options that you want pass to template. Use dot
                     notation, e.g. templateOptions.metaDescription
  --options          ReDoc options, use dot notation, e.g.
                     options.nativeScrollbars
```
