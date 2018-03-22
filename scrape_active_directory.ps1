#Scrape activeDirectroy

#import-module activedirectory
Param(
[Parameter(Position=0,Mandatory=$True,HelpMessage="Enter a top level user name")]
[string]$identity
)

Function Get-DirectReports {
[cmdletbinding()]

Param(
[Parameter(Position=0,ValueFromPipelineByPropertyName=$True)]
[string]$DistinguishedName,
[int]$Tab=2
)

Process {
 $direct = Get-ADUser -Identity $DistinguishedName -Properties DirectReports

 if ($direct.DirectReports) {
  $direct.DirectReports | Get-ADUser -Properties SamAccountName,Title | foreach {
   "{0} [{1}] - {2}" -f $_.Name.padleft($_.name.length+$tab),$_.SamAccountName,$_.Title
   $_ | Get-DirectReports -Tab $($tab+2)
  }
 }

} #process

} #end function

$user = Get-ADUser $Identity -Properties DirectReports,SamAccountName
$reports = $user.DirectReports

"{0} [{1}] - {2}" -f $User.name,$User.SamAccountName, $User.Title

foreach ($report in $reports) {
$direct = $report | Get-ADUser -Properties DirectReports,SamAccountName,Title
"{0} [{1}] - {2}" -f $direct.name.padleft($direct.name.length+1,">"),$direct.SamAccountName,$direct.Title
$direct | Get-DirectReports
} #foreach
