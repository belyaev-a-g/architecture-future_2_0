rm terraform.tfstate
rm terraform.tfstate.backup
curl -X POST http://localhost:4566/_ministack/reset
terraform init
terraform plan
terraform apply --auto-approve
