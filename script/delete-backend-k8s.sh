#!/bin/bash

# Bash script for deleting backend resources

echo -e "\033[33m⚠️  WARNING: This will delete all Wine App Backend resources!\033[0m"
echo -e "\033[33m- Namespace: wine-app\033[0m"
echo -e "\033[33m- ConfigMap: wine-backend-config\033[0m"
echo -e "\033[33m- Secret: wineapp-backend-database-connection\033[0m"
echo -e "\033[33m- Deployment: wine-backend-deployment\033[0m"
echo -e "\033[33m- Service: wine-backend-service\033[0m"
echo ""

read -p "Are you sure you want to delete backend? (y/N): " confirmation

if [[ "$confirmation" == "y" || "$confirmation" == "Y" || "$confirmation" == "yes" || "$confirmation" == "Yes" ]]; then
    echo -e "\033[31m🗑️  Deleting Wine App Backend resources...\033[0m"
    
    kubectl delete -f ../backend/deployment.yaml
    kubectl delete -f ../backend/service.yaml
    kubectl delete -f ../common/configmap.yaml
    kubectl delete -f ../common/secret.yaml
    
    echo -e "\033[32m✅ Deleted Backend Deployment, Service, ConfigMap, Secret\033[0m"
else
    echo -e "\033[36m❌ Deletion cancelled.\033[0m"
fi 