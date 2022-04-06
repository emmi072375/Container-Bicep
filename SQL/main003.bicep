targetScope =  'subscription'


//Create a Resource Parameters
param myResourceGroup string = 'Zellytest01-rg'
param location string = 'eastus'

//Create a DB Parameter 
@description('The name of the SQL logical server.')
param serverName string = 'myServerProd'

@description('The name of the SQL Database.')
param sqlDBName string = 'myDatabaseProd'


@description('The administrator username of the SQL logical server.')
param administratorLogin string = 'zellyadmin'

@description('The administrator password of the SQL logical server.')

param administratorLoginPassword string = 'Pophouse1234%'




//Create Resource Group 

resource myRG01 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: myResourceGroup
  location: location
}

// Create a SQL module 
module sqltest007 'sql.bicep' = {
  name: 'mySqlDeploy'
  scope: myRG01
  params: {
    location: location
    serverName: serverName
    sqlDBName: sqlDBName
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}

