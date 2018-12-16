## Digital ocean
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
  
export  KUBECONFIG=/home/js/Docker/k8s-setting/k8s-1-12-3-do-1-nyc1-1544917662600-kubeconfig.yaml


## See node
kubectl get nodes

## Run
kubectl create -f yaml/deployment.yaml
kubectl create -f yaml/service.yaml

## Update
kubectl apply -f yaml/deployment.yaml

kubectl exec -it rshiny-74f459c4f6-lt6qj -- bin/bash


## See service
kubectl get svc
kubectl scale deploy rshiny --replicas=1


# Get commands with basic output
kubectl get services                          # List all services in the namespace
kubectl get pods --all-namespaces             # List all pods in all namespaces
kubectl get pods -o wide                      # List all pods in the namespace, with more details
kubectl get deployment rshiny                 # List a particular deployment
kubectl get pods --include-uninitialized      # List all pods in the namespace, including uninitialized ones

# Describe commands with verbose output
kubectl describe deployment rshiny
kubectl describe service rshiny


kubectl delete deployment --all
kubectl delete services --all



