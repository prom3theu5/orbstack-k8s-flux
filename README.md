## Pulse : a local orbstack flux development cluster

[OrbStack](https://docs.orbstack.dev/) is a fast, light, and simple way to run containers and Linux machines.
It's a supercharged alternative to Docker Desktop and WSL, all in one easy-to-use app.

What's more, it automatically handles https creation for local development, meaning if you apply an ingress controller
like we apply traefik here, you get automatic https locally, without the need for cert manager.

See more here: [Orbstack https](https://docs.orbstack.dev/features/https)

---

## Deployed Stack info:

Uses Gitea as a local git server.
```text
username: git
password: gitpassword
```
Gitea: https://gitea.k8s.orb.local

Traefik dashboard accessible on: https://traefik.k8s.orb.local

Hostpath storage class: `csi-hostpath-sc`.

---

## Prerequisites
- [Orbstack](https://orbstack.dev/) installed
- [Task](https://taskfile.dev/) installed

There is a Brewfile which can be used to install all dependencies.

```bash
brew bundle Brewfile
```

---

## App Versions

Versions of helm charts used to deploy the baseline apps can be controlled from the `versions.yaml` file in the `apps` directory.

---

## Storage

The default orbstack local-path provisioner is removed automatically, as it doesn't offer snapshot support.
Instead, we use the [hostpath-csi](https://github.com/kubernetes-csi/csi-driver-host-path) provisioner, which is installed automatically.
This allows us to use volume snapshots, which is required for testing volsync.

This is set as the default storage class, and volume snapshot class.

The storage class is set to `csi-hostpath-sc`.


---

All Commands

```bash
task
task: Available tasks for this project:
* deploy-app:all:                  Deploy all apps to the cluster
* deploy-app:flux:                 Deploy FluxCD to the cluster
* deploy-app:gitea:                Deploy Gitea to the cluster
* deploy-app:traefik:              Deploy Traefik to the cluster
* deploy-app:cnpg:                 Deploy CNPG postgres operator to the cluster.
* flux:add-ks:                     Add a kustomization to flux
* flux:add-source:                 Add the git source to flux
* orbstack:new-full-cluster:       Setup a fresh cluster, and deploy all apps...      (aliases: orb:new-full-cluster)
* orbstack:remove-cluster:         Reset the orbstack cluster                         (aliases: orb:remove-cluster)
* orbstack:reset-cluster:          Delete the cluster, then start a new one.          (aliases: orb:reset-cluster)
```

---

## Main usage

### Run the new cluster, and provision with traefik, cnpg, a database for gitea, gitea - and flux.

```bash
task orb:new-full-cluster
```

### Fully remove the entire cluster.

```bash
taesk orb:remove-cluster
```

