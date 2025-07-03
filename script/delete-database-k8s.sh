#!/bin/bash

# Bash script for deleting database resources

echo -e "\033[33m⚠️  WARNING: This will delete all Wine App Database resources!\033[0m"
echo -e "\033[33m- Namespace: wine-app\033[0m"
echo -e "\033[33m- StorageClass: ebs-sc\033[0m"
echo -e "\033[33m- PVC: mongodb-wine-app-pvc (DATA WILL BE LOST!)\033[0m"
echo -e "\033[33m- Deployment: mongodb-wine-app-deployment\033[0m"
echo -e "\033[33m- Service: mongodb-wine-app-service-clusterip\033[0m"
echo ""
echo -e "\033[31m⚠️  WARNING: All database data will be permanently lost!\033[0m"
echo ""

read -p "Are you sure you want to delete database? (y/N): " confirmation

if [[ "$confirmation" == "y" || "$confirmation" == "Y" || "$confirmation" == "yes" || "$confirmation" == "Yes" ]]; then
    echo -e "\033[31m🗑️  Deleting Wine App Database resources...\033[0m"
    
    # Delete deployment and service first
    kubectl delete -f ../database/deployment.yaml
    kubectl delete -f ../database/service.yaml
    
    # Wait for pods to terminate
    echo -e "\033[33m⏳ Waiting for pods to terminate...\033[0m"
    sleep 5
    
    # Delete storage (PVC and StorageClass)
    kubectl delete -f ../common/storage.yaml
    
    echo -e "\033[32m✅ Deleted Database Deployment, Service, PVC, StorageClass\033[0m"
    echo -e "\033[31m⚠️  All database data has been permanently deleted!\033[0m"
else
    echo -e "\033[36m❌ Deletion cancelled.\033[0m"
fi 