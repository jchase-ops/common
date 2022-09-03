<#
.SYNOPSIS

Get error information.


.DESCRIPTION

Get detailed error information when exception is thrown.


.PARAMETER Exception

Exception object (must be terminating).


.PARAMETER CommandName

Command name used for output.


.PARAMETER ModuleName

Module name used for output.


.EXAMPLE

try {
    Set-Location -Path "FAKEDRIVE:\" -ErrorAction Stop
}
catch {
    Get-ErrorInfo -Exception $_
}

Category           : ObjectNotFound
CategoryReason     : DriveNotFoundException
ExceptionErrorCode : 80131501
ExceptionFullName  : System.Management.Automation.DriveNotFoundException
ExceptionMessage   : Cannot find drive. A drive with the name 'FAKEDRIVE' does not exist.
InvocationName     : Set-Location
Line               :     Set-Location "FAKEDRIVE:\" -ErrorAction Stop

MyCommand          : Set-Location
OffsetInLine       : 5
PSCommandPath      : 
PSScriptRoot       : 
ScriptLineNumber   : 2
CommandName        :
ModuleName         :

This example tries to change the directory to a drive that doesn't exist.
The exception is caught and used as the -Exception parameter value.


.EXAMPLE

try {
    Set-Location -Path "FAKEDRIVE:\" -ErrorAction Stop
}
catch {
    Get-ErrorInfo -Exception $_ -CommandName New-FakeCommand -ModuleName FakeModule
}

Category           : ObjectNotFound
CategoryReason     : DriveNotFoundException
ExceptionErrorCode : 80131501
ExceptionFullName  : System.Management.Automation.DriveNotFoundException
ExceptionMessage   : Cannot find drive. A drive with the name 'FAKEDRIVE' does not exist.
InvocationName     : Set-Location
Line               :     Set-Location "FAKEDRIVE:\" -ErrorAction Stop

MyCommand          : Set-Location
OffsetInLine       : 5
PSCommandPath      :
PSScriptRoot       :
ScriptLineNumber   : 2
CommandName        : Testing
ModuleName         : TripleTesting

This example is the same as the previous with the addition of using -CommandName and
-ModuleName as parameters.


.INPUTS
System.Management.Automation.ErrorRecord
System.String

.OUTPUTS
ErrorInfo

.NOTES
This was mostly something to test various ways to import classes into modules.  I frequently
add it into a module during development to easily troubleshoot issues.
#>
function Get-ErrorInfo {

    [CmdletBinding()]

    Param (
        
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [System.Object]
        $Exception,

        [Parameter(Mandatory = $false, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $CommandName,

        [Parameter(Mandatory = $false, Position = 2)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $ModuleName
    )

    if ($CommandName) {
        if ($ModuleName) {
            [ErrorInfo]::New($Exception, $CommandName, $ModuleName)
        }
        else {
            [ErrorInfo]::New($Exception, $CommandName)
        }
    }
    else {
        [ErrorInfo]::New($Exception)
    }
}