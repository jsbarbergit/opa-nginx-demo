IMAGE=jsb/auth-proxy
TAG=0.6.1
# Build the image
pushd ./apps/auth_proxy
docker build --no-cache -t ${IMAGE} .
docker tag ${IMAGE}:latest ${IMAGE}:${TAG}
popd
# Add the image to minikubes cache
minikube cache add ${IMAGE}:${TAG}
minikube cache reload
