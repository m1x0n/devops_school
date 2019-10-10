#!/usr/bin/env bash

# Start minikube on Mac (-_-)
minikube start --vm-driver=hyperkit --disk-size='5g'

# Enable nginx-ingress
minikube addons enable ingress

# Check ingress controller is up
kubectl get pods -n kube-system

# Create deployment for an app
kubectl create -f deployment.yaml

# Create service
kubectl create -f service.yaml

# Expose service
minikube service devops-school-service

# Get service url
minikube service devops-school-service --url

# Check service
curl http://192.168.64.2:30080

# Create ingress
kubectl apply -f ingress.yaml

# Check ingress status
kubectl get ing

# Try to resolve service by dns or add devops-school.local 192.168.64.2 to /etc/hosts
curl -H "Host: devops-school.local" 192.168.64.2
