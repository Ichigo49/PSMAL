function Test-MALcredential {
    param(
    [Parameter(HelpMessage="Set this if you want to provide your own alternate credentials.")]
    [System.Management.Automation.Credential()]
    $Credential = [System.Management.Automation.PSCredential]::Empty
    )

    if ($Credential -eq [System.Management.Automation.PSCredential]::Empty) {
        $Credential = Get-Credential
    }

    $uri = "$global:MALurl/account/verify_credentials.xml"
    try {
        $Result = Invoke-RestMethod -Uri $uri -Method Get -Credential $Credential
        $Result.user
    } catch {
        Write-Error "StatusCode:" $_.Exception.Response.StatusCode.value__
        Write-Error "StatusDescription:" $_.Exception.Response.StatusDescription
    }
    
}