function Get-SpecificProcess {

Get-Process | ?{$_.name -eq "winlogon"}

}