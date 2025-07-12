# rsync container

## UID and GID

First set the UID and GID that received files will have by editing the ARGs in `rsync/Dockerfile`.
```
ARG UID=1000
ARG GID=1000
```

## First time build
On the first use, `make build` will generate SSH host keys in `rsync/keys`, create empty folders for `data` and `authorized_keys`, and build the container. Subsequent builds will only build the container if `rsync/keys` is present. Delete `rsync/keys` and run `make build` to regenerate host keys.

## Adding a pubkey
Copy the pubkey data into `config/ssh/authorized_keys`. The `config/ssh` folder corresponds to `/home/rsync/.ssh` in the container.

## Starting the container and port
`make start` will start the container on port `22022`.

## Client-side sending
Data can be copied to `/home/rsync/data`. On the host side this corresponds to `data/data`.
