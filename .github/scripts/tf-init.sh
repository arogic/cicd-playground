#!/bin/bash

terraform init -input=false \
-backend-config "resource_group_name=$BACKEND_RESOURCE_GROUP" \
-backend-config "storage_account_name=$BACKEND_STORAGE_ACCOUNT_NAME" \
-backend-config "container_name=$BACKEND_CONTAINER_NAME" \
-backend-config "key=iac.tfstate"