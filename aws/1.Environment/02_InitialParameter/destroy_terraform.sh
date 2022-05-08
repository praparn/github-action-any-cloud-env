cp ../../99.Systemplate/global_variable.auto.tfvars ./
cp ../../99.Systemplate/global_variables.tf ./
cp ../../99.Systemplate/system_variable.auto.tfvars ./
cp ../../99.Systemplate/system_variables.tf ./
publickey="$(cat ./cert-template.pub)"
echo "TF_VAR_public_key=$(echo $publickey)
terraform init -backend-config="access_key=$TF_VAR_access_key" -backend-config="secret_key=$TF_VAR_secret_key" -backend-config="region=$TF_VAR_region" -input=false
terraform destroy --auto-approve
rm ./global_variable.auto.tfvars
rm ./global_variables.tf
rm ./system_variable.auto.tfvars
rm ./system_variables.tf