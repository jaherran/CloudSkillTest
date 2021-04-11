$MyResourceGroupName="jhpowershell"
$MyResourceLocation="East Us"

Connect-AzAccount
#Log in and select the account and get the tenant number


Set-AzContext -Tenant -Subscription free

# Create resource group
$MyResourceGroup=New-AzResourceGroup -Name $MyResourceGroupName -Location $MyResourceLocation

# Create subnet
$subnetConfig=New-AzVirtualNetworkSubnetConfig -Name "jhsubnet" -AddressPrefix 10.1.0.0/24

# Create Network
