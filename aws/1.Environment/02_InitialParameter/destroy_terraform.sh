cp ../../99.Systemplate/global_variable.auto.tfvars ./
cp ../../99.Systemplate/global_variables.tf ./
terraform destroy --auto-approve
rm ./global_variable.auto.tfvars
rm ./global_variables.tf