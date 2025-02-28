param location string = resourceGroup().location
param namePrefix string = 'storage_'
param name string = 'DefaultStorageName'

var storageAccountName = '${namePrefix}${name}' //'${namePrefix}${uniqueString(resourceGroup().id)}'
var storageAccountSku = 'Standard_RAGRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: storageAccountSku
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
  }
}

output storageAccountId string = storageAccount.id
