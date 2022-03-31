targetScope = 'subscription'


//Create Resource Parameters 
param myResourceGroup string = 'myResource-rg'
param location string = 'northeurope'


//Create Peering Parameters

@description('Name for vNet 1')
param vnet1Name string = 'vNet1'


@description('Name for vnet 2')
param vnet2Name string = 'vNet2'



resource myRG05 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: myResourceGroup
  location: location
}


module myPeering 'peering.bicep' = {
  name: 'myPeeringDeploy'
  scope: myRG05
  params: {
    vnet1Name: vnet1Name
    vnet2Name: vnet2Name
    location: location
  }
}

