#!/bin/bash
today=`date '+%Y_%m_%d__%H_%M_%S'`;
filename="./log/Result_$today.log"
clear
# Input access_key/secret_key (can skip if run second time)
#echo "Please input your access_key <Skip if you run twice time>:"
#read access_key
#echo "Please input your secret_key <Skip if you run twice time>:"
#read secret_key
# Export value to environment variable
#export TF_VAR_access_key=$access_key
#export TF_VAR_secret_key=$secret_key
echo "====================================Finished to Set Credential=========================================="
echo "===================================Import Global Configuration=========================================="
cp ../../global_variable.auto.tfvars ./global_variable.auto.tfvars
echo "=================================Start Execution Process Now !!!========================================"
./99_automate.sh >> $filename

echo "===============================Finished Execution Process Now !!!======================================="