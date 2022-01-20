kubectl create cm opa-policies -n opa --dry-run=client -o yaml --from-file=policies/policy001.rego > cm.yaml
kubectl apply -f cm.yaml
kubectl scale deploy opa -n opa --replicas 0
kubectl scale deploy opa -n opa --replicas 1