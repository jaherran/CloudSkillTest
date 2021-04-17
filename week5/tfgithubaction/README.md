## Execute your Azure login and get you access ID ("44cf98fd-a133-4e53-beb4-ac149e28d8e6")
az login

## Create a service principal account to deploy resources with terraform
az ad sp create-for-rbac -n "TerraJH" --role contributor --scopes /subscriptions/44cf98fd-a133-4e53-beb4-ac149e28d8e6

The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
{
  "appId": "c032072a-86cc-4046-bc3c-2bbcbd9f01ae",
  "displayName": "TerraJH",
  "name": "http://TerraJH",
  "password": "f7wa~HYX6D5M~sbfMYwSE~78bC9R4XThWC",
  "tenant": "64415341-932a-40cd-b156-0e78843cb909"
}