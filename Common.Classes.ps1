#region Class
class ErrorInfo {

    #region Properties
    [System.String] $Category
    [System.String] $CategoryReason
    [System.String] $ExceptionErrorCode
    [System.String] $ExceptionFullName
    [System.String] $ExceptionMessage
    [System.String] $InvocationName
    [System.String] $Line
    [System.String] $MyCommand
    [System.String] $OffsetInLine
    [System.String] $PSCommandPath
    [System.String] $PSScriptRoot
    [System.String] $ScriptLineNumber
    [System.String] $ScriptName
    [System.String] $CommandName
    [System.String] $ModuleName
    #endregion

    #region Constructors
    ErrorInfo (
        [PSObject] $Exception
    ) {
        $this.Category = $Exception.CategoryInfo.Category
        $this.CategoryReason = $Exception.CategoryInfo.Reason
        $this.ExceptionErrorCode = $Exception.Exception.HResult.ToString('x')
        $this.ExceptionFullName = $Exception.Exception.GetType().FullName
        $this.ExceptionMessage = $Exception.Exception.Message -Split "\r?\n" | Select-Object -Last 1
        $this.InvocationName = $Exception.InvocationInfo.InvocationName
        $this.Line = $Exception.InvocationInfo.Line
        $this.MyCommand = $Exception.InvocationInfo.MyCommand
        $this.OffsetInLine = $Exception.InvocationInfo.OffsetInLine
        $this.PSCommandPath = $Exception.InvocationInfo.PSCommandPath
        $this.PSScriptRoot = $Exception.InvocationInfo.PSScriptRoot
        $this.ScriptLineNumber = $Exception.InvocationInfo.ScriptLineNumber
        $this.ScriptName = $Exception.InvocationInfo.ScriptName
        $this.CommandName = $MyInvocation.MyCommand.Name
        $this.ModuleName = $MyInvocation.MyCommand.ModuleName
    }

    ErrorInfo (
        [PSObject] $Exception,
        [System.String] $CommandName
    ) {
        $this.Category = $Exception.CategoryInfo.Category
        $this.CategoryReason = $Exception.CategoryInfo.Reason
        $this.ExceptionErrorCode = $Exception.Exception.HResult.ToString('x')
        $this.ExceptionFullName = $Exception.Exception.GetType().FullName
        $this.ExceptionMessage = $Exception.Exception.Message -Split "\r?\n" | Select-Object -Last 1
        $this.InvocationName = $Exception.InvocationInfo.InvocationName
        $this.Line = $Exception.InvocationInfo.Line
        $this.MyCommand = $Exception.InvocationInfo.MyCommand
        $this.OffsetInLine = $Exception.InvocationInfo.OffsetInLine
        $this.PSCommandPath = $Exception.InvocationInfo.PSCommandPath
        $this.PSScriptRoot = $Exception.InvocationInfo.PSScriptRoot
        $this.ScriptLineNumber = $Exception.InvocationInfo.ScriptLineNumber
        $this.ScriptName = $Exception.InvocationInfo.ScriptName
        $this.CommandName = $CommandName
        $this.ModuleName = $MyInvocation.MyCommand.ModuleName
    }

    ErrorInfo (
        [PSObject] $Exception,
        [System.String] $CommandName,
        [System.String] $ModuleName
    ) {
        $this.Category = $Exception.CategoryInfo.Category
        $this.CategoryReason = $Exception.CategoryInfo.Reason
        $this.ExceptionErrorCode = $Exception.Exception.HResult.ToString('x')
        $this.ExceptionFullName = $Exception.Exception.GetType().FullName
        $this.ExceptionMessage = $Exception.Exception.Message -Split "\r?\n" | Select-Object -Last 1
        $this.InvocationName = $Exception.InvocationInfo.InvocationName
        $this.Line = $Exception.InvocationInfo.Line
        $this.MyCommand = $Exception.InvocationInfo.MyCommand
        $this.OffsetInLine = $Exception.InvocationInfo.OffsetInLine
        $this.PSCommandPath = $Exception.InvocationInfo.PSCommandPath
        $this.PSScriptRoot = $Exception.InvocationInfo.PSScriptRoot
        $this.ScriptLineNumber = $Exception.InvocationInfo.ScriptLineNumber
        $this.ScriptName = $Exception.InvocationInfo.ScriptName
        $this.CommandName = $CommandName
        $this.ModuleName = $ModuleName
    }
    #endregion

    #region Methods

    #endregion
}
#endregion