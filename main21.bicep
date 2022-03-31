targetScope = 'subscription'

// Create a Storage Parameter

@description('Storage Account type')
@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])
param storageAccountType string = 'Standard_LRS'

@description('Specifies the name of the blob container.')
param containerName string = 'zellycontainer01'

@description('The name of the Storage Account')
param storageAccountName string = 'emranstorage11'


//Create Resource Group Parameter 

param myResourceGroup string = 'emran007-rg'
param location string = 'northeurope'





//Create Resource Group 

resource myRG01 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: myResourceGroup
  location: location

}


// Create Module 

module myContainer 'container01.bicep' = {
  name: 'myContainerDeploy'
  scope: myRG01
  params: {
    storageAccountName: storageAccountName
    storageAccountType: storageAccountType
    containerName: containerName
    location: location

  }
}
