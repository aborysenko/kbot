# Create k3d cluster

`k3d.exe cluster create artem-cluster --agents 3`

![alt](/doc/images/k3dcluster.png)

# Setup ArgoCD

`kubectl create namespace argocd`

![alt](/doc/images/kubectlcrtnamespace.png)

`kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`

![alt](/doc/images/kubectlapply.png)

 Access the ArgoCD web interface:

`kubectl port-forward svc/argocd-server -n argocd 8080:443`

![alt](/doc/images/argocdrun.png)

Run http:localhost:8080 to open admin page:

![alt](/doc/images/argocdadminpage.png)

# Deploy application with ArgoCD

![alt](/doc/images/deploy.png)

Check services:

![alt](/doc/images/getsvc.png)

Run ambassador:

![alt](/doc/images/runapp.png)

