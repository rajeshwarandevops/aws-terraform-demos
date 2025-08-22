#!/bin/bash

# Exit immediately if a command fails
set -e

# Format Terraform code
echo ">>> Formatting Terraform files..."
terraform fmt -recursive

sleep 05

# Validate Terraform configuration
echo ">>> Validating Terraform configuration..."
terraform validate

# Show the execution plan
echo ">>> Running Terraform plan..."
terraform plan 

sleep 05

# Apply the plan automatically with approval
echo ">>> Applying Terraform changes..."
terraform apply --auto-approve

echo ">>> Terraform execution completed successfully!"
