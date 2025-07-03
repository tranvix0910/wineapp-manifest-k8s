#!/bin/bash

# Bash script for deleting frontend resources

echo -e "\033[33m⚠️  WARNING: This will delete all Wine App Frontend resources!\033[0m"
echo -e "\033[33m- Namespace: wine-app\033[0m"
echo -e "\033[33m- Deployment: wine-app-frontend-deployment\033[0m"
echo -e "\033[33m- Service: wine-app-frontend-clusterip\033[0m"
echo -e "\033[33m- Ingress: wine-app-frontend-ingress\033[0m"
echo ""

read -p "Are you sure you want to delete? (y/N): " confirmation

if [[ "$confirmation" == "y" || "$confirmation" == "Y" || "$confirmation" == "yes" || "$confirmation" == "Yes" ]]; then
    echo -e "\033[31m🗑️  Deleting Wine App Frontend resources...\033[0m"
    
    kubectl delete -f ../frontend/deployment.yaml
    kubectl delete -f ../frontend/service.yaml
    kubectl delete -f ../frontend/ingress.yaml
    kubectl delete namespace wine-app
    
    echo -e "\033[32m✅ Deleted Deployment, Service, Ingress Wine App Frontend\033[0m"
else
    echo -e "\033[36m❌ Deletion cancelled.\033[0m"
fi 