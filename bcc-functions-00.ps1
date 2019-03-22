<# PowerShell: Function and Form @ Boise Code Camp 2019
.FILE bcc18-functions-00.ps1
.AUTHOR Ryan Coates
.LINK https://github.com/ryandcoates/bcc18-functions

#>

#region Tiny script that does something specific

Get-Process | ?{$_.name -eq "winlogon"}

#endregion

cls

#region Simple function wrapper

function Get-SpecificProcess {

Get-Process | ?{$_.name -eq "winlogon"}

}

cls

Get-SpecificProcess
Get-SpecificProcess -Verbose

#endregion

cls

#region Params syntax

function Get-SpecificProcess {

    Param(
    $name = "winlogon"
    )

Write-Verbose "Getting info on Process: $name"
Get-Process | ?{$_.name -eq "$name"}

}

Get-SpecificProcess
Get-SpecificProcess -Name explorer

Get-SpecificProcess -Verbose
#endregion

cls

#region AdvancedFunction syntax

function Get-SpecificProcess {
[CmdletBinding()]
    Param(
    [string]$name = "winlogon"
    )

Write-Verbose "Getting info on Process: $name"
Get-Process | ?{$_.name -eq "$name"}

}

Get-SpecificProcess
Get-SpecificProcess -Name explorer -Verbose

#endregion

cls
