## Setup orbstack local kubernetes cluster as a perfect testbed for flux development / testing

Uses Gitea as a local git server.

Username/Password: `git` / `gitpassword`

Traefik dashboard accessible on: https://traefik.k8s.orb.local

Gitea: https://gitea.k8s.orb.local

---

All Commands

```bash
task
task: Available tasks for this project:
* deploy-app:all:                  Deploy all apps to the cluster
* deploy-app:flux:                 Deploy FluxCD to the cluster
* deploy-app:gitea:                Deploy Gitea to the cluster
* deploy-app:hostpath-csi:         Deploy hostpath-csi to the cluster. This gives us volume snapshot support locally.
* deploy-app:traefik:              Deploy Traefik to the cluster
* flux:add-ks:                     Add a kustomization to flux
* flux:add-source:                 Add the git source to flux
* orbstack:new-full-cluster:       Setup a fresh cluster, and deploy all apps...      (aliases: orb:new-full-cluster)
* orbstack:remove-cluster:         Reset the orbstack cluster                         (aliases: orb:remove-cluster)
* orbstack:reset-cluster:          Delete the cluster, then start a new one.          (aliases: orb:reset-cluster)
```

---

Main usage:

```bash
task orb:new-full-cluster
```

Run the new cluster, and provision with traefik, gitea, hostpath provisioner (which allows for volsync testing) and flux 2.5.1

```bash
taesk orb:remove-cluster
```

Fully remove the entire cluster.

