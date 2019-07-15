#!/bin/bash

#Add Ingress for reverse/proxy -todo

export k8s_app_namespace=hello-ns

kubectl create -f nginxConfigmap.yml --namespace=${k8s_app_namespace}
kubectl create -f nginxServiceAccount.yml --namespace=${k8s_app_namespace}
kubectl create -f nginxDeployment.yml  --namespace ${k8s_app_namespace}
kubectl create -f nginxService.yml --namespace ${k8s_app_namespace}
kubectl create -f nginxResource1.yml --namespace ${k8s_app_namespace}

