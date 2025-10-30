# Gitlab runner in Kubernetes

Repository contains blueprints and knowledge about running gitlab-runner in kubernetes cluster.

## How to deploy 
1. Create gitlab-runner namespace
2. Create secret `gitlab-runner-secrer.tml` with the values from the registration process form (gitlab runner token).
3. Review values and deploy with helm (or with flux/argo) - `gitlab-runner.yml` contains required values etc.
4. Additionally permission to access registry auth secret has to be added to k8s SA:

```bash
kubectl patch serviceaccount gitlab-runner \
  -p '{"imagePullSecrets": [{"name": "$SECRET_NAME"}]}' \
  -n <namespace-where-gitlab-runner-runs>
```

**IMPORTANT**  Review RBAC changes - with this deployment, gitlab-runner creates runner instances via communication with kube-api.
