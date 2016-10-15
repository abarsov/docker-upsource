# docker-upsource

[UpSource](https://www.jetbrains.com/upsource) Docker Container

## Starting the container

The following command will start an UpSource instance on port 8080.

```
docker run -d --name some_upsource -p 8080:8080 alonsodomin/upsource
```

After starting the container you should go to URL `http://<server name>:8080` and finish
the installation/configuration.

## Preserving state

All UpSource's state is written to disk at `/var/lib/upsource`, this folder
is also expose as a volume so it can be mounted from outside the container.

```
docker run -d --name some_upsource -p 8080:8080 -v /persistent/store:/var/lib/upsource alonsodomin/upsource
```
