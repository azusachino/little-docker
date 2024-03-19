# PHP MongoDB

Stateless Application

## [link](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/)

1. create mongo deployment  
   `kubectl apply -f mongo-deployment.yml`

2. create monogo service  
   `kubectl apply -f mongo-service.yml`

3. create frontend deployment  
   `kubectl apply -f frontend-deployment.yml`
   `kubectl get pods -l app.kubernetes.io/name=guestbook -l app.kubernetes.io/component=frontend`
4. create frontend service  
   `kubectl apply -f frontend-deployment.yml`

5. view the frontend service  
   `kubectl port-forward svc/frontend 8080:80`

6. (Optional) Scale the web frontend  
   `kubectl scale deployment frontend --replicas=5`

7. clean up  
   `kubectl delete deployment -l app.kubernetes.io/name=mongo`
   `kubectl delete service -l app.kubernetes.io/name=mongo`
   `kubectl delete deployment -l app.kubernetes.io/name=guestbook`
   `kubectl delete service -l app.kubernetes.io/name=guestbook`