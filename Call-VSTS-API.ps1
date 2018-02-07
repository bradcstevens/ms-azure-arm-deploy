
$pat = 'kcqcplly2ccl5hpalgxj54bifvct6puxbvzu4sogwe3b6biea4kq'
$encodedPat = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes(":$pat"))
 
# Build the url to list the projects
$listurl = 'https://stevenssystems.visualstudio.com/defaultcollection/_apis/projects?api-version=1.0'
 
# Call the REST API
$resp = Invoke-RestMethod -Uri $listurl -Headers @{Authorization = "Basic $encodedPat"}
 
Write-Output $resp.value