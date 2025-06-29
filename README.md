## Les étapes à suivre pour déployer une application sur Kubernetes en utilisant ArgoCD 

Nous créons un tunnel local qui redirige le port 8080 de notre machine vers le port 443 (HTTPS) du service ArgoCD dans le cluster Kubernetes. cela nous permet d'accéder à l'interface web d'ArgoCD via https://localhost:8080 depuis notre navigateur. :
```
kubectl port-forward -n argocd svc argocd-server 8080:443
```

le username par défaut est : _admin_ 

le mot de passe peut être récupéré avec la commande suivante :

kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode

Nous mettons sur le github notre projet qui doit contenir les fichiers manifests.

Nous écrivons le fichier application.yaml qui définit principalement, ......

nous faisons un push afin que tout soit dans le repo distant.

et sur notre machine local nous exécutons la commande :

```
kubectl apply -f application.yaml
```

### Ordre d'exécution des manifests :
ArgoCD applique les manifests par ordre de priorité des ressources Kubernetes :

- Namespaces d'abord
- ConfigMaps et Secrets
- Services
- Deployments en dernier

Dans votre cas, l'ordre sera automatiquement :

- namespace.yaml
- configmap.yaml et secret.yaml
- cluster-ip-booking-database.yaml et cluster-ip-booking-service.yaml
- deployment-booking-database.yaml et deployment-booking-service.yaml

Sur l'interface web de argocd nous obtiendrons ce jolie disgramme :

Nous cliquons sur le diagramme, pour afficher plus de détails : 

