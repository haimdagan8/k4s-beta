REM ## Infrastructure deployment ##
cd ./infra-terraform
tf apply --auto-approve

REM ## Building Images via ACR ##
cd ./application/
az acr build -t domainsale:v1 -r "k4sartifacts" .
REM ## Change Dockerfile to V2 ##
az acr build -t domainsale:v2 -r "k4sartifacts" .
REM ## k8s deployment ##
cd ../
k apply -f manifests/