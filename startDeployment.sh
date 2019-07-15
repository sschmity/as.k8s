#!/bin/bash

#Add Ingress for reverse/proxy -todo
#minikube addons enable ingress
#start with
#sudo minikube start --vm-driver=none



export k8s_app_namespace=hello-ns
kubectl create namespace ${k8s_app_namespace}
kubectl get ns ${k8s_app_namespace}

#optional step-> start proxy
#install proxy and access to k8s rest api
#kubectl proxy --port=8080
#curl 127.0.0.1:8080/apis/apps/v1/

#Deploy apps

#1) Check the configmap.yml file which describes the configuration map
#Create the config map in Kubernetes cluster using kubectl:

kubectl create -f hello-configmap.yml --namespace=${k8s_app_namespace}
kubectl get cm --namespace=${k8s_app_namespace}
kubectl get configmap hello-configmap --namespace=${k8s_app_namespace} -o yaml #view resource content
#kubectl edit configmap hello-configmap --namespace=${k8s_app_namespace} -o yaml #edit resource content



#2) Enter the password for the admin account in password.txt. Make sure the password files don't contain any empty lines on the beginning or the end of the file.
#Generate a secret using the password files and kubectl.

kubectl create secret generic hello-secret --from-file=password.txt --namespace ${k8s_app_namespace}
#Label the created secret with labels app=mysql, layer=db and project=etherpad:
kubectl label secret hello-secret app=hello-world  --namespace ${k8s_app_namespace}

#OR Convert your secret data to a base-64 representation (IMPORTANT: secret is encoded into base64)
#suppose you want to have two pieces of secret data: a username my-app and a password 39528$vdg7Jb. First, use Base64 encoding to convert your username and password to a base-64 representation. Here’s a Linux example:
#echo -n 'my-app' | base64
#echo -n '39528$vdg7Jb' | base64
#create declarative secret object file with base64 result
kubectl apply -f hello-secret.yml --namespace ${k8s_app_namespace}





kubectl create -f hello-deployment.yml  --namespace ${k8s_app_namespace} #give your manifest file under source managment control
#rolling update and rollback
#in deployment, replication controller is replaced by replicaset -> kubectl get rc must be replaced by kubectl get rs
#k describe deployment hello-deploy
#kubectl get rs
#to access it  externally, you still need to deploy a service in front of it ( see hello-service.yml file)
#to check it, take a node ip (minion) from the cluster , here the same host as running in the minikube context and suffix it by the nodeport expose in the service


# apply to apply on an existing kubernetes object (for i.e deployment)
#k apply -f hello-deployment.yml --record  #highly recommended to add flag --record to be able to trace the rollout history
#k rollout status deployment hello-deploy
#k rollout history deployment hello-deploy
#
# deployment.extensions/hello-deploy
#REVISION  CHANGE-CAUSE
#1         <none>
#2         kubectl apply --filename=hello-deployment.yml --record=true


#kubectl get rs # we get 2 replicaset , new and old with 0 pod , easy to rollback

#NAME                      DESIRED   CURRENT   READY   AGE
#hello-deploy-6b89589f9    8         8         8       7m27s
#hello-deploy-6bb7fc6db5   0         0         0       39m


#kubectl rollout undo deployment hello-deploy --to-revision=1



#k create configmap (cm) /secret
  # Create a new configmap named my-config from the key=value pairs in the file
  #kubectl create configmap my-config --from-file=path/to/bar

  # Create a new configmap named my-config from an env file
  #kubectl create configmap my-config --from-env-file=path/to/bar.env

#start related Service
  . ./startService.sh
