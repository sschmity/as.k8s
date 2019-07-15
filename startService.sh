#!/bin/bash
export k8s_app_namespace=hello-ns
kubectl create -f hello-service.yml --namespace ${k8s_app_namespace}


k get svc -n hello-ns -o wide
#NAME        TYPE       CLUSTER-IP   EXTERNAL-IP   PORT(S)          AGE   SELECTOR
#hello-svc   NodePort   10.99.9.75   <none>        8080:30001/TCP   68s   app=hello-world


k describe svc hello-svc -n hello-ns
#Name:                     hello-svc
#Namespace:                hello-ns
#Labels:                   app=hello-world
#Annotations:              <none>
#Selector:                 app=hello-world
#Type:                     NodePort
#IP:                       10.99.9.75
#Port:                     <unset>  8080/TCP
#TargetPort:               8080/TCP
#NodePort:                 <unset>  30001/TCP
#Endpoints:                172.17.0.5:8080,172.17.0.6:8080,172.17.0.7:8080
#Session Affinity:         None
#External Traffic Policy:  Cluster
#Events:                   <none>



k get ep -n hello-ns -o wide
#NAME        ENDPOINTS                                         AGE
#hello-svc   172.17.0.5:8080,172.17.0.6:8080,172.17.0.7:8080   106s

k describe ep hello-svc -n hello-ns
#Name:         hello-svc
#Namespace:    hello-ns
#Labels:       app=hello-world
#Annotations:  endpoints.kubernetes.io/last-change-trigger-time: 2019-07-15T15:11:30Z
#Subsets:
#  Addresses:          172.17.0.5,172.17.0.6,172.17.0.7
#  NotReadyAddresses:  <none>
#  Ports:
#    Name     Port  Protocol
#    ----     ----  --------
#    <unset>  8080  TCP
#
#Events:  <none>



#service get a stable reliable virtual IP - DNS - Port(clusterIP, nodePort, LoadBalancer) , never changes, use a load balancer to pod (Replicatset), also create an endoint rest object for it with list of PODs ip address.
#use DNS inside the cluster or environment variables
#how to link pods with service -->labels LABELS and labels again (service matching-> all services labels must match the pods labels. Others pods label can be optional.
#kubectl get service -o wide --all-namespaces
#kubectl describe pods | grep -i hello-world -- to ensure app exists with this label
#kubectl get endpoints ( see endpoints automatically linked to a service (same name as the linked service)
#kubectl describe ep hello-svc

