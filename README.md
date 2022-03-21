# docker-ipharo
The image for IPharo - Jupyter notebooks for Pharo Smalltalk

## What is the image about

This image is the dockerization of the [IPharo](https://github.com/jmari/iPharo) project, that makes it possible to run Pharo (smalltalk) code in Jupyter notebooks.

## How to use it

An example of usage could be:

```bash
docker run -p 8888:8888 --name ipharo -v ~/Desktop/notebooks:/notebooks  euberdeveloper/ipharo
```

This would start a jupyter notebook supporting Pharo code inside a docker container, exposing it to port 8888 of localhost. By going to `http://localhost:8888` you could try it yourself. 

The notebooks created would be stored in the `/notebooks` directory, in the phisical Desktop of the user (this is due to the `-v` option).

## Environment variables

All the environment variables supported are referred to the `jupyter notebook` command arguments:
- For each argument shown with `jupyter notebook --help`, there is a corresponding environment variable with the same name, but in **uppercase** and with **underscores**. For example, `--allow-root` would become `ALLOW_ROOT`. To note that if the type of the argument is a **boolean**, every non-empty value will be considered as `true`.
- For each additional argument shown with `jupyter notebook --help-all`, there is a corresponding environment variable with the same name and scope, but in **uppercase snake-case** and with the **scope** put as **prefix**. For example, `--NotebookApp.allow_root` would become `NOTEBOOK_APP_ALLOW_ROOT`. Note that here, even for booleans, the value that is passed is exactly the value of the env var.

The only **predefined env vars** are:
- `ALLOW_ROOT` with value `TRUE`.
- `IP` with value `0.0.0.0`.
- `NOTEBOOK_DIR` with value `/notebooks`.
- `NO_BROWSER` with value `TRUE`.

## How is it made

This image is automatically published with a github action of [this repo](https://github.com/euberdeveloper/docker-ipharo/runs/5634955453?check_suite_focus=true)