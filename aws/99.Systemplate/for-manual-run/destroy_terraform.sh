cp ../../99.Systemplate/global_variable.auto.tfvars ./
cp ../../99.Systemplate/global_variables.tf ./
cp ../../99.Systemplate/system_variable.auto.tfvars ./
cp ../../99.Systemplate/system_variables.tf ./
terraform destroy --auto-approve
rm ./global_variable.auto.tfvars
rm ./global_variables.tf
rm ./system_variable.auto.tfvars
rm ./system_variables.tf