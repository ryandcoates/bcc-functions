<# PowerShell: Function and Form @ Boise Code Camp 2018
.FILE bcc18-functions-01.ps1
.AUTHOR Ryan Coates
.LINK https://github.com/ryandcoates/bcc18-functions

#>

#region Asking Questions

function Do-Something {
    Param(
    [Parameter(Mandatory=$True)]
    [String]$Name,

    [Parameter(Mandatory=$True)]
    [Int]$Age
    )
    [int]$currentyear = (Get-Date -format yyyy)
    [int]$birthyear = ($currentyear - $age)
    
    Write-Output "Hello $Name, you were born before this date in $birthyear, or after this date in " ($birthyear -1)
}

#endregion

#region Controllers

function BirthYear {
    Param(
    [Parameter(Mandatory=$True)]
    [int]$Birthyear
    )

    Write-Output "You were born in $BirthYear"
}


function Do-Something {
    Param(
    [Parameter(Mandatory=$True)]
    [String]$Name,

    [Parameter(Mandatory=$True)]
    [Int]$Age
    )

    [int]$currentyear = (Get-Date -format yyyy)
    [int]$birthyear = ($currentyear - $age)

     $yes = New-Object System.Management.Automation.Host.ChoiceDescription '&Yes', 'I have celebrated my birthday this year'
     $no = New-Object System.Management.Automation.Host.ChoiceDescription '&No', 'I have not celebrated my birthday this year yet'
     $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
     $result = $host.ui.PromptForChoice('Happy Birthday?', 'Have you celebrated your birthday this year?', $options, 0)
     $birthyear = ($currentyear - $age)
     switch ($result)

         {
             0 {
                 $message = "Hello $Name, you were born before this date in $birthyear"
             }
             1 {
                 $birthyear = ($birthyear -1)
                 $message = "Hello $Name, you were born before this date in $birthyear"
             }
         }
     Write-Output $message
 }

 function Do-SomethingElse {
     Param(
    [Parameter(Mandatory=$True)]
    [Int]$Age
    )

    [int]$currentyear = (Get-Date -format yyyy)
    [int]$birthyear = ($currentyear - $age)

     $yes = New-Object System.Management.Automation.Host.ChoiceDescription '&Yes', 'I have celebrated my birthday this year'
     $no = New-Object System.Management.Automation.Host.ChoiceDescription '&No', 'I have not celebrated my birthday this year yet'
     $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
     $result = $host.ui.PromptForChoice('Happy Birthday?', 'Have you celebrated your birthday this year?', $options, 0)
     $birthyear = ($currentyear - $age)
     switch ($result)

         {
             0 {
             }
             1 {
                 $birthyear = ($birthyear -1)
             }
         }
    BirthYear -Birthyear $birthyear
 }

 #endregion Controllers