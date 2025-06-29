#!/bin/bash
set -e

NAMESPACE=dev

echo "Creating namespace..."
kubectl apply -f namespace.yaml

echo "Applying secrets..."
kubectl apply -f secret.yaml

echo "Applying configmap..."
kubectl apply -f configmap.yaml

echo "Deploying PostgreSQL..."
kubectl apply -f deployment-booking-database.yaml
kubectl apply -f cluster-ip-booking-database.yaml

echo "Deploying booking-service..."
kubectl apply -f deployment-booking-service.yaml
kubectl apply -f cluster-ip-booking-service.yaml

echo "Deployment complete!"

