#!/bin/bash
kubectl create -f hello-replicasetController.yml
#replication controller -> scalability /resiliency/ reliability/ desired state
#if you want to update the yaml file for the replication controller(for i.e change the desired state, please run kubectl apply -f  hello-replicationController.yml
#kubectl apply should be used on resource created by either kubectl create --save-config or kubectl apply
#--NAME       DESIRED   CURRENT   READY   AGE
#--hello-rc   3         3         3       19s
#kubectl describe pods --list all pods
#kubectl get pods --all-namespaces
#kubectl describe pods/hello-rc-kb6xd -- list only this pod
#kubectl describe rc
#kubectl get rc -o wide

#imperative order to expose rc as a service (between 30000 - 32767)
#kubectl expose rc  hello-rc --name=hello-svc --target-port=8080 --type=NodePort
#take the nodePort value and access the service hostip:nodeport
#describe the service
#kubectl describe svc/hello-svc
#kubectl delete svc/hello-svc  --to delete this service