function Test-MALcredential {
    [CmdletBinding()]
	param()

    try {
        $Result = Invoke-MALApi -RestMethod 'account/verify_credentials.xml'
        $Result.user
    } catch {
        Write-Error "StatusCode:" $_.Exception.Response.StatusCode.value__
        Write-Error "StatusDescription:" $_.Exception.Response.StatusDescription
    }
    
}