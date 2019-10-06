# Kubernetes toolbox

A utility script to launch a shell in a semi-persistent pod on a cluster, with TTL.

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

Copy [the ktoolbox script](https://raw.githubusercontent.com/dln/ktoolbox/master/ktoolbox) somewhere within your `$PATH` and make it executable.

## Usage

```
  ktoolbox [-n namespace] [cmd...]
    -h             Display this help message.
    -n NAMESPACE   Use given namespace instead of context default.
```
