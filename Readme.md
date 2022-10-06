# Docker NodeJS - Alpine

## Build Image
`docker build .`

for specific docker images

`docker build - < Dockerfile`

## Find the image ID

`docker images`

## run docker with created image

`docker run -p 3000:3000 <Image ID>`

# Kubernetes - Minikube - Docker (Dev Environment)

## Install Kubernetes (Make sure Docker already installed)

Linux

    sudo apt-get update
    sudo apt-get install -y ca-certificates curl

Mac

    brew install kubectl

once installation done run 

    kubectl cluster-info

if you can see error as below

    The connection to the server <server-name:port> was refused - did you specify the right host or port?

this is because we haven't installed Minikube



## Install Minikube

Linux

    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
Mac

    brew install minikube

start minikube by using following command

    minikube start

To open dashboard 

    minikube dashboard


## Lets Start

Lets run docker build image and deploy to kubernetes

    docker build -t russelrajitha/docker-demo .
    kubectl apply -f deployment.yml

now you can see deployments by using `kubectl get deployment`

let's see how many pods you have

    kubectl get pods

it will display there is no assigned pods for your deployment. so we can create pods by entering following command

    kubectl apply -f service.yml

now you can see services created from our service by using 

    kubectl get svc

copy your service name (for me `docker-demo-service`) and let's bind it with minikube 

    minikube service docker-demo-service


### Now You are done !!! 

for shutting down all the services 

    kubectl delete -f deployment.yml
    kubectl delete -f service.yml

