sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu kubelet=1.13.5-00 kubeadm=1.13.5-00 kubectl=1.13.5-00
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml
sudo kubeadm join <your unique string from the output of kubeadm init>
kubectl run nginx --image=nginx

kubectl get deployments
kubectl get pods
kubectl port-forward [pod_name] 8081:80
curl --head http://127.0.0.1:8081
kubectl exec -it <pod_name> -- nginx -v
kubectl expose deployment nginx --port 80 --type NodePort

kubectl get services

curl -I localhost:$node_port
