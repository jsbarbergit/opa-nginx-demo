kubectl scale deploy authz --replicas 0
./build_serve_authproxy_image.sh
kubectl apply -f ./deploy-authz.yaml
