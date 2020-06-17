# Kubernetes Dev Container

A docker container to create local dev environment to for managing kubernetes. To spawn a new local kubernetes dev container, run one of the below make commands.

```sh
make compose-run
make classic-run
```

## Troubleshoot

To address issues with docker compose stucked at `Attaching to kubectl-host`. Open another terminal and run below command.

```sh
docker attach kubectl-host
```

## Contact

[Mail](guptaprabhay@yahoo.com)
