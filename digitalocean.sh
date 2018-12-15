
## Digital ocean
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

cd /home/js/Docker/k8s-setting/yaml

kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" get nodes
kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" create -f ./deployment.yaml
kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" create -f ./service.yaml

kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" get svc
kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" scale deploy rshiny --replicas=2


# Get commands with basic output
kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" get services                          # List all services in the namespace
kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" get pods --all-namespaces             # List all pods in all namespaces
kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" get pods -o wide                      # List all pods in the namespace, with more details
kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" get deployment rshiny                 # List a particular deployment
kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" get pods --include-uninitialized      # List all pods in the namespace, including uninitialized ones

# Describe commands with verbose output
kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" describe nodes rshiny
kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" describe pods rshiny


kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" delete deployment --all
kubectl --kubeconfig="k8s-1-12-3-do-1-nyc1-1544875442129-kubeconfig.yaml" delete services --all



