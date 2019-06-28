#!/bin/bash
kubectl create -f hello-pod.yml
#kubectl describe pods
#kubectl get pods --all-namespaces
#kubectl get pods/hello-pod -- list only this pod
#kubectl delete pods hello-pod