<#
.SYNOPSIS
  This is a simple wrapper function to produce the 
  object that will be serialized out to disk as a json parameter file
#>
function New-ParamFileObject( $ParameterObject, $ParameterVersion = '1.0.0.0' )
{
  $ParamFileObject = New-Object PSObject

  Add-Member -InputObject $ParamFileObject -MemberType NoteProperty -Name '$schema' -Value "http://schema.management.azure.com/schemas/2015-01-01/deploymentParameters.json#"
  Add-Member -InputObject $ParamFileObject -MemberType NoteProperty -Name 'contentVersion' -Value $ParameterVersion
  Add-Member -InputObject $ParamFileObject -MemberType NoteProperty -Name 'parameters' -Value $ParameterObject

  #
  # Extra items
  #
  $ep = New-Object PSObject
  $ep | Add-Member -MemberType NoteProperty -Name 'subscriptionName' -Value ''
  $ep | Add-Member -MemberType NoteProperty -Name 'resourceGroupName' -Value ''
  $ep | Add-Member -MemberType NoteProperty -Name 'templateFile' -Value ''
  $ep | Add-Member -MemberType NoteProperty -Name 'chefEnvironment' -Value ''
  $ep | Add-Member -MemberType NoteProperty -Name 'chefTags' -Value ''
  $ep | Add-Member -MemberType NoteProperty -Name 'chefRunList' -Value ''
  $ep | Add-Member -MemberType NoteProperty -Name 'chefBootstrapTimeout' -Value 15

  Add-Member -InputObject $ParamFileObject -MemberType NoteProperty -Name 'deploymentDetails' -Value $ep

  return $ParamFileObject
}


function New-AvParameterObject()
{
  $p = New-Object PSObject 

  $AppNameTag = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'AppNameTag' -Value $AppNameTag
  $AppEnvTag = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'AppEnvTag' -Value $AppEnvTag
  $SecZoneTag = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'SecZoneTag' -Value $SecZoneTag
  $avName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'avName' -Value $avName
  $updateDomainCount = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'updateDomainCount' -Value $updateDomainCount
  $faultDomainCount = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'faultDomainCount' -Value $faultDomainCount

  return $p
}



<#
.SYNOPSIS
  Generates a blank parameter object to use for serializing
  the settings of individual system definitions to a parameter file
#>
function New-ParameterObject( $Version = 1 )
{
  Switch($Version)
  {
    1 { return New-ParameterObjectV1 }
    2 { return New-ParameterObjectV2 }
    3 { return New-ParameterObjectV3 }
  }
}


<#
.SYNOPSIS

.DESCRIPTION
Long description

.EXAMPLE
An example

.NOTES
General notes
#>
function New-ParameterObjectV1()
{
  $p = New-Object PSObject 

  # location
  $location = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'location' -Value $location
  # tagAppNameValue
  $tagAppNameValue = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'tagAppNameValue' -Value $tagAppNameValue
  # tagAppEnvValue
  $tagAppEnvValue = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'tagAppEnvValue' -Value $tagAppEnvValue
  # tagSecZoneValue
  $tagSecZoneValue = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'tagSecZoneValue' -Value $tagSecZoneValue
  # vmName
  $vmName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vmName' -Value $vmName
  # vmSize
  $vmSize = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vmSize' -Value $vmSize
  # dataDiskSizeInGB
  $dataDiskSizeInGB = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'dataDiskSizeInGB' -Value $dataDiskSizeInGB
  # managedDiskType
  $managedDiskType = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'managedDiskType' -Value $managedDiskType
  # imagePublisher
  $imagePublisher = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'imagePublisher' -Value $imagePublisher
  # imageOffer
  $imageOffer = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'imageOffer' -Value $imageOffer
  # imageVersion
  $imageVersion = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'imageVersion' -Value $imageVersion
  # imageRelease
  $imageRelease = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'imageRelease' -Value $imageRelease
  # adminUserName
  $adminUserName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'adminUserName' -Value $adminUserName
  # adminPassword
  $adminPassword = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'adminPassword' -Value $adminPassword
  # vnetResGrp
  $vnetResGrp = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vnetResGrp' -Value $vnetResGrp
  # vnetName
  $vnetName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vnetName' -Value $vnetName
  # subnetName
  $subnetName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'subnetName' -Value $subnetName
  # ipAddress
  $ipAddress = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'ipAddress' -Value $ipAddress
  # diagStorAcctName
  $diagStorAcctName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'diagStorAcctName' -Value $diagStorAcctName

  return $p
}


<#
.SYNOPSIS
Short description

.DESCRIPTION
Long description

.EXAMPLE
An example

.NOTES
General notes
#>
function New-ParameterObjectV2()
{
  $p = New-Object PSObject 

  $location = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'location' -Value $location
  $AppNameTag = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'AppNameTag' -Value $AppNameTag
  $AppEnvTag = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'AppEnvTag' -Value $AppEnvTag
  $SecZoneTag = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'SecZoneTag' -Value $SecZoneTag
  $vmName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vmName' -Value $vmName
  $vmSize = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vmSize' -Value $vmSize
  $osDiskSize = New-PVO -Value 32 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'osDiskSize' -Value $osDiskSize
  $diskCount = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'diskCount' -Value $diskCount
  $disk01Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk01Size' -Value $disk01Size
  $disk02Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk02Size' -Value $disk02Size
  $disk03Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk03Size' -Value $disk03Size
  $disk04Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk04Size' -Value $disk04Size
  $disk05Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk05Size' -Value $disk05Size
  $disk06Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk06Size' -Value $disk06Size
  $disk07Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk07Size' -Value $disk07Size
  $disk08Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk08Size' -Value $disk08Size
  $disk09Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk09Size' -Value $disk09Size
  $disk10Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk10Size' -Value $disk10Size
  $managedDiskType = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'managedDiskType' -Value $managedDiskType
  $vnetResGrp = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vnetResGrp' -Value $vnetResGrp
  $vnetName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vnetName' -Value $vnetName
  $subnetName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'subnetName' -Value $subnetName
  $ipAddress = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'ipAddress' -Value $ipAddress
  $diagStorAcctName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'diagStorAcctName' -Value $diagStorAcctName

  return $p
}


function New-ParameterObjectV3()
{
  $p = New-Object PSObject 

  $location = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'location' -Value $location
  $AppNameTag = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'AppNameTag' -Value $AppNameTag
  $AppEnvTag = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'AppEnvTag' -Value $AppEnvTag
  $SecZoneTag = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'SecZoneTag' -Value $SecZoneTag
  $vmName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vmName' -Value $vmName
  $vmSize = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vmSize' -Value $vmSize
  $osDiskSize = New-PVO -Value 32 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'osDiskSize' -Value $osDiskSize
  $diskCount = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'diskCount' -Value $diskCount
  $disk01Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk01Size' -Value $disk01Size
  $disk02Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk02Size' -Value $disk02Size
  $disk03Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk03Size' -Value $disk03Size
  $disk04Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk04Size' -Value $disk04Size
  $disk05Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk05Size' -Value $disk05Size
  $disk06Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk06Size' -Value $disk06Size
  $disk07Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk07Size' -Value $disk07Size
  $disk08Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk08Size' -Value $disk08Size
  $disk09Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk09Size' -Value $disk09Size
  $disk10Size = New-PVO -Value 0 -Type 'Integer'
  $p | Add-Member -MemberType NoteProperty -Name 'disk10Size' -Value $disk10Size
  $managedDiskType = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'managedDiskType' -Value $managedDiskType
  $vnetResGrp = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vnetResGrp' -Value $vnetResGrp
  $vnetName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'vnetName' -Value $vnetName
  $subnetName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'subnetName' -Value $subnetName
  $ipAddress = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'ipAddress' -Value $ipAddress
  $diagStorAcctName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'diagStorAcctName' -Value $diagStorAcctName
  $avName = New-PVO -Value ''
  $p | Add-Member -MemberType NoteProperty -Name 'avName' -Value $avName

  return $p
}


<#
.SYNOPSIS
  This is a another helper since all parameters are actually
  objects with single 'value' properties, to simplify the 
  New-ParameterObject method body
#>
function New-PVO( $Value, $Type = 'String' )
{
  $o = New-Object PSObject 
  $o | Add-Member -MemberType NoteProperty -Name 'value' -TypeName $Type -Value $Value

  return $o
}


<#
.SYNOPSIS
  Save the file to disk
#>
function Save-ParamFile( $ResourceName, $ParamFileObject, $Overwrite = $false )
{
  New-Item -ItemType Directory -Path .\created -Force | Out-Null
  try {
    if( $Overwrite )
    {
      $ParamFileObject | ConvertTo-Json -Depth 10 | Out-File ".\created\$($ResourceName).param.json"
    }
    else
    {
      $ParamFileObject | ConvertTo-Json -Depth 10 | Out-File ".\created\$($ResourceName).param.json" -NoClobber
    }
    
  }
  catch 
  {
    Write-Host 'ERROR: Failed to save parameter file because one already existed.'
    Write-Host "       Saving backup copy as [ .\created\$($ResourceName).param.failed.json ]"
    $ParamFileObject | ConvertTo-Json -Depth 10 | Out-File ".\created\$($ResourceName).param.failed.json"
  }
  
}


<#
.SYNOPSIS
  Generate the console prompts to Select
  a subscription to be used
#>
function Select-SubscriptionName( )
{
  $Subscriptions = Get-AzureRmSubscription

  $SelectedIndex = 0
  for( $i = 0; $i -lt $Subscriptions.Length; $i++ )
  {
    Write-Host "$($i+1)) $($Subscriptions[$i].Name)"
  }
  $SelectedIndex = Read-Host "Select a subscription"

  return $Subscriptions[$SelectedIndex-1].Name
}


<#
.SYNOPSIS
  Translate a tshirt size string into the related
  Azure VM size value
#>
function Get-MappedTshirtSize( $TshirtSize )
{
  $AzureSize = "Standard_F2S"
  Switch( $TshirtSize.ToLower() )
  {
    "xxsmall" { $AzureSize = "Standard_F1S" }
    # 1 Core, 2GB Memory
    "xsmall"  { $AzureSize = "Standard_F1S" }
    # 2 Core, 4GB Memory
    "small"   { $AzureSize = "Standard_F2S" }
    # 4 Core, 8GB Memory
    "medium"  { $AzureSize = "Standard_F4S" }
    # 8 Core, 16GB Memory
    "large"   { $AzureSize = "Standard_F8S" }
    # 16 Core, 32GB Memory
    "xlarge"  { $AzureSize = "Standard_F16S" }

    'rx'     { $AzureSize = 'Standard_DS12_v2' }
    'hdp'    { $AzureSize = 'Standard_DS14_v2' }
  }

  return $AzureSize
}


<#
.SYNOPSIS
  Translate a tshirt size string into the related
  os disk size (in GB)
#>
function Get-MappedOsSize( $TshirtSize, $Platform )
{
  $OsSize = 128
  if( $Platform -eq 'windows' )
  {
    return $OsSize
  }

  Switch( $TshirtSize.ToLower() )
  {
    "xxsmall" { $OsSize = 64  }
    "xsmall"  { $OsSize = 64  }
    "small"   { $OsSize = 64  }
    "medium"  { $OsSize = 64  }
    "large"   { $OsSize = 128 }
    "xlarge"  { $OsSize = 128 }
    'rx'      { $OsSize = 128 }
  }

  return $OsSize
}


<#
.SYNOPSIS
  Translate a tshirt size string into the related
  data disk size (in GB)
#>
function Get-MappedDataSize( $TshirtSize )
{
  $DataSize = 64
  Switch( $TshirtSize.ToLower() )
  {
    "xxsmall" { $DataSize = 32   }
    "xsmall"  { $DataSize = 64   }
    "small"   { $DataSize = 128  }
    "medium"  { $DataSize = 256  }
    "large"   { $DataSize = 512  }
    "xlarge"  { $DataSize = 1024 }
    'rx'      { $DataSize = 512  }
  }

  return $DataSize
}
