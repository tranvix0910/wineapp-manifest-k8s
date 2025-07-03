#!/bin/bash

# Bash script for deploying frontend

echo -e "\033[36m🚀 Ready to deploy Wine App Frontend resources!\033[0m"
echo -e "\033[36m- Namespace: wine-app\033[0m"
echo -e "\033[36m- Deployment: wine-app-frontend-deployment\033[0m"
echo -e "\033[36m- Service: wine-app-frontend-clusterip\033[0m"
echo -e "\033[36m- Ingress: wine-app-frontend-ingress\033[0m"
echo ""

read -p "Do you want to deploy? (y/N): " confirmation

if [[ "$confirmation" == "y" || "$confirmation" == "Y" || "$confirmation" == "yes" || "$confirmation" == "Yes" ]]; then
    echo -e "\033[33m📦 Deploying Wine App Frontend resources...\033[0m"
    
    kubectl apply -f ../common/namespace.yaml
    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml
    kubectl apply -f ../common/ingress-alb.yaml
    
    echo -e "\033[32m✅ Frontend deployment completed!\033[0m"
    
    echo ""
    echo -e "\033[36m🔍 Checking deployment status...\033[0m"
    kubectl get pods -n wine-app -l app=wine-app-frontend
    kubectl get svc -n wine-app -l app=wine-app-frontend
    kubectl get ingress -n wine-app
else
    echo -e "\033[31m❌ Deployment cancelled.\033[0m"
fi 