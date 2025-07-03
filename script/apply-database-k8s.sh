#!/bin/bash

# Bash script for deploying database resources

echo -e "\033[36m🚀 Ready to deploy Wine App Database resources!\033[0m"
echo -e "\033[36m- Namespace: wine-app\033[0m"
echo -e "\033[36m- StorageClass: ebs-sc\033[0m"
echo -e "\033[36m- PVC: mongodb-wine-app-pvc\033[0m"
echo -e "\033[36m- Deployment: mongodb-wine-app-deployment\033[0m"
echo -e "\033[36m- Service: mongodb-wine-app-service-clusterip\033[0m"
echo ""

read -p "Do you want to deploy database? (y/N): " confirmation

if [[ "$confirmation" == "y" || "$confirmation" == "Y" || "$confirmation" == "yes" || "$confirmation" == "Yes" ]]; then
    echo -e "\033[33m📦 Deploying Wine App Database resources...\033[0m"
    
    # Deploy storage first (StorageClass and PVC)
    kubectl apply -f ../common/storage.yaml
    
    # Wait a moment for storage to be ready
    echo -e "\033[33m⏳ Waiting for storage to be ready...\033[0m"
    sleep 3
    
    # Deploy deployment and service
    kubectl apply -f ../database/deployment.yaml
    kubectl apply -f ../database/service.yaml
    
    echo -e "\033[32m✅ Database deployment completed!\033[0m"
    
    echo ""
    echo -e "\033[36m🔍 Checking database deployment status...\033[0m"
    kubectl get pvc -n wine-app
    kubectl get pods -n wine-app -l app=mongodb
    kubectl get svc -n wine-app -l app=mongodb
else
    echo -e "\033[31m❌ Database deployment cancelled.\033[0m"
fi 