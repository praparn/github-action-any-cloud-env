#!/bin/bash
today=`date '+%Y_%m_%d__%H_%M_%S'`;
filename="./log/Result_$today.log"
clear
# Input access_key/secret_key (can skip if run second time)
echo "Please kindly export your access_key/secret_key to environment variable before use this script"
echo "======================================================================================================="
echo "export TF_VAR_access_key=<your access key>"
echo "export TF_VAR_secret_key=<your secret key>"
echo "======================================================================================================="
echo "Your current environment variable now:"
echo "======================================================================================================="
echo "TF_VAR_access_key:"
echo $TF_VAR_access_key
echo "TF_VAR_secret_key:"
echo $TF_VAR_secret_key
echo "======================================================================================================="
echo "Please input 'Yes'. If you already check and confirm the environment variable."
echo "======================================================================================================="
read answer
if [ "${answer}" ]; then
if [ "${answer}" != 'Yes' ]; then
exit
fi
else
exit
fi
echo "====================================Finished to Set Credential=========================================="
echo "===================================Import Global Configuration=========================================="
cp ../../99.Systemplate/global_variable.auto.tfvars ./
cp ../../99.Systemplate/global_variables.tf ./
cp ../../99.Systemplate/system_variable.auto.tfvars ./
cp ../../99.Systemplate/system_variables.tf ./
echo "=================================Start Execution Process Now !!!========================================"
./99_automate.sh >> $filename
rm ./global_variable.auto.tfvars
rm ./global_variables.tf
rm ./system_variable.auto.tfvars
rm ./system_variables.tf
echo "===============================Finished Execution Process Now !!!======================================="
terraform output