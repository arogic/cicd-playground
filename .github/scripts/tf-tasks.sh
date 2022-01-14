#!/usr/bin/env bash

TASK=$1

init() {
  terraform init -input=false \
  -backend-config "resource_group_name=$BACKEND_RESOURCE_GROUP_NAME" \
  -backend-config "storage_account_name=$BACKEND_STORAGE_ACCOUNT_NAME" \
  -backend-config "container_name=$BACKEND_CONTAINER_NAME" \
  -backend-config "key=iac.tfstate"
}

fmt() {
  terraform fmt -check -diff
}

validate() {
  terraform validate
}

plan() {
  terraform plan \
  -compact-warnings \
  -input=false
#  -var-file="./tfvars.json" \
#  -out="./tfplan.out"
}

apply() {
  terraform apply \
  -input=false \
  -compact-warnings \
  "./tfplan.out"
}

case $TASK in
  init) init ;;
  fmt) fmt ;;
  validate) validate ;;
  plan) plan ;;
  apply) apply ;;
esac