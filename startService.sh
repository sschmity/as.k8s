#!/bin/bash
kubectl create -f hello-service.yml
#service get a stable reliable virtual IP - DNS - Port(clusterIP, nodePort, LoadBalancer) , never changes, use a load balancer to pod (Replicatset), also create an endoint rest object for it with list of PODs ip address.
#use DNS inside the cluster or environment variables
#how to link pods with service -->labels LABELS and labels again (service matching-> all services labels must match the pods labels. Others pods label can be optional.
#kubectl get service -o wide --all-namespaces
#kubectl describe pods | grep -i hello-world -- to ensure app exists with this label
#kubectl get endpoints ( see endpoints automatically linked to a service (same name as the linked service)
#kubectl describe ep hello-svc

