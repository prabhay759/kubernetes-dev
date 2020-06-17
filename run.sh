docker rm kubectl-host
docker build --rm -f Dockerfile -t localkube .
docker run -d --network=host --name=kubectl-host --rm -it localkube:latest
kubectl config view --raw > config
docker cp config kubectl-host:./root/.kube/
docker attach kubectl-host
