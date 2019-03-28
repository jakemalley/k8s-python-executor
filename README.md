# K8S Python Executor

A simple image based on `python:3.7-alpine` to execute Python scripts inside a directory. By default the `entrypoint.sh` script will execute all `.py` files in the directory `/opt/scripts/`

## Quick Start

There are two examples provided that both make use of Kubernetes CronJobs - See below:

### All-In-One (CronJob and ConfigMap)

1. Create the `ConfigMap` and `CronJob` from a single YAML file:

    ```
    kubectl apply -f examples/cronjob-aio.yaml

### Standalone (CronJob, with ConfigMap created from a folder)

1. Create the `ConfigMap` from a folder:
    
    ```
    kubectl create configmap example-scripts-dir --from-file=examples/exampleScripts
    ```
    
2. Create the `CronJob`

    ```
    kubectl apply -f examples/cronjob-standalone.yaml
    ```
