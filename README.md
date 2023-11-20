# Kubernetes Toolbox

Launch a shell in a semi-persistent pod on a cluster, with automatic expiration when idle.

When running `ktoolbox` it will check if an existing toolbox pod is running,
then exec into it and start a bash shell. If the pod does not exist, or has
exited, the script will (re)create it before proceeding.

The default maximum idle time before exiting is 180 minutes, but can be
customized using the `-i` flag.

```% ktoolbox
 _______          _ _                              Node: gke-myproject-cluster-nodes-df48b632-bcb2
|__   __|        | | |                          Host IP: 192.168.42.89
   | | ___   ___ | | |__   _____  __      Pod Namespace: default
   | |/ _ \ / _ \| | '_ \ / _ \ \/ /           Pod Name: toolbox-dln
   | | (_) | (_) | | |_) | (_) >  <              Pod IP: 192.168.100.21
   |_|\___/ \___/|_|_.__/ \___/_/\_\    Service Account: default

default/toolbox-dln:~$
```

## Installation

Copy [the ktoolbox script](https://raw.githubusercontent.com/dln/ktoolbox/main/ktoolbox)
somewhere within your `$PATH` and make it executable. Enjoy!

### One line system-wide install:
```
sudo curl -L https://git.io/JeCE4 -o /usr/local/bin/ktoolbox && sudo chmod +x /usr/local/bin/ktoolbox
```

## Usage

```
  ktoolbox [-c image] [-i max_idle_mins] [-n namespace] [-N name] [cmd...]
    -h                 Display this help message.
    -f                 Force recreation of toolbox pod even if running.
    -N NAME            Use given container name instead of the default (toolbox-$USER).
                       Can also be set using KTOOLBOX_NAME environment variable.
    -n NAMESPACE       Use given namespace instead of context default.
                       Can also be set using KTOOLBOX_NAMESPACE environment variable.
    -i MAX_IDLE_MINS   Max idle time in minutes before exiting. 180 mins by default.
                       Can also be set using KTOOLBOX_MAX_IDLE_MINS environment variable.
    -c IMAGE           Override default container image (dlneintr/toolbox:latest).
                       Can also be set using KTOOLBOX_IMAGE environment variable.
```

## Customizing the container
The default container image contains various useful utilities, but may be customized to taste.
Any image may be used as long as it has `bash` and `curl` installed, since
these are used in the entrypoint script to handle expiration.

Easiest is to make a custom Dockerfile like this:

```
FROM ghcr.io/dln/ktoolbox
RUN sudo apk add -U --no-cache memcached redis
```

You can override the image used by ktoolbox with either the `-c` flag or,
more conveniently, by setting the `KTOOLBOX_IMAGE` environment variable.

## Extra tooling
To keep the image size down, the default container has only a few basics installed.
However, it includes a few convenience scripts to afford download and installation
of more tools.

Included installers:

- `install-gcloud.sh` -- Installs [Google Cloud SDK](https://cloud.google.com/sdk)
