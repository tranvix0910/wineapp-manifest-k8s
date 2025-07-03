#!/bin/bash

# Bash script for deploying backend resources

echo -e "\033[36m🚀 Ready to deploy Wine App Backend resources!\033[0m"
echo -e "\033[36m- Namespace: wine-app\033[0m"
echo -e "\033[36m- ConfigMap: wine-backend-config\033[0m"
echo -e "\033[36m- Secret: wineapp-backend-database-connection\033[0m"
echo -e "\033[36m- Deployment: wine-backend-deployment\033[0m"
echo -e "\033[36m- Service: wine-backend-service\033[0m"
echo ""

read -p "Do you want to deploy backend? (y/N): " confirmation

if [[ "$confirmation" == "y" || "$confirmation" == "Y" || "$confirmation" == "yes" || "$confirmation" == "Yes" ]]; then
    echo -e "\033[33m📦 Deploying Wine App Backend resources...\033[0m"
    
    kubectl apply -f ../common/configmap.yaml
    kubectl apply -f ../common/secret.yaml
    kubectl apply -f ../backend/deployment.yaml
    kubectl apply -f ../backend/service.yaml
    
    echo -e "\033[32m✅ Backend deployment completed!\033[0m"
    
    echo ""
    echo -e "\033[36m🔍 Checking backend deployment status...\033[0m"
    kubectl get pods -n wine-app -l app=wine-app-backend
    kubectl get svc -n wine-app -l app=wine-app-backend
else
    echo -e "\033[31m❌ Backend deployment cancelled.\033[0m"
fi 