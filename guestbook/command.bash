# Part I

## Create frontend deployment
kubectl create -f part-1/frontend-deployment.yaml
## Get Pcdod Name & Port-Forwarding
kubectl port-forward $(kubectl get pods -l app=guestbook,tier=frontend -o jsonpath="{.items[0].metadata.name}") 3000:3000 &
curl 127.0.0.1:3000
## Acces via browser to 127.0.0.1:3000

## Create backend deployment
kubectl create -f part-1/redis-master-deployment.yaml
kubectl create -f part-1/redis-slave-deployment.yaml




# Part II

## Create backend services
kubectl create -f part-2/redis-master-service.yaml
kubectl create -f part-2/redis-slave-service.yaml
## Create frontend services
kubectl create -f part-2/frontend-service.yaml
## Get NODE_PORT and access frontend
curl http://$(minikube ip):$(kubectl get svc frontend -o jsonpath="{.spec.ports[0].nodePort}")
## Access via browser to:
echo "http://$(minikube ip):$(kubectl get svc frontend -o jsonpath="{.spec.ports[0].nodePort}")"
