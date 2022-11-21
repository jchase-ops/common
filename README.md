# PowerShell Module - Common - *Outdated*
PS module of common functions

This module was initially created while I was testing various ways to import classes into modules.

The method I settled on was to create a $ModuleName.Classes.ps1 file and import it at the start of the module manifest:

  . "$PSScriptRoot\$(Split-Path -Path $(Split-Path -Path $PSScriptRoot -Parent) -Leaf).Classes.ps1"
  
I found the function incredibly useful for troubleshooting during development, so I figured I should share it.
