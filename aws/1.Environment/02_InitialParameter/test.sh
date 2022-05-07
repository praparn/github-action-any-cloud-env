       if [ ! -f cert-template.pub ]
       then

       echo "Warning !!! No public key found. System will help to auto-generate certificate for you. Anyway please copy your private key immediatly after this process complete for avoid let private key store on git repository !!!"
       rm ./cert-template*
       ssh-keygen -t rsa -N '' -f ./cert-template
       publickey="$(cat ./cert-template.pub)"
       export TF_VAR_public_key=$publickey

       else
       echo "Start to import public certificate to sytem variable"
       publickey="$(cat ./cert-template.pub)"
       export TF_VAR_public_key=$publickey

       fi