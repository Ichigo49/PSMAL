function Get-MALToken {
    <#
    .Synopsis
    Internal function to retrieve the MyAnimeList Token from disk

    .Notes
    Created by Mathieu ALLEGRET <mathieu.allegret@gmail.com>
    #>
    [OutputType([System.Management.Automation.PSCredential])]
    [CmdletBinding()]
    param ()

    ### Read the token from disk
	$Token = Get-Content -Path ('{0}\token.json' -f (Split-Path -Path $MyInvocation.MyCommand.Module.Path -Parent)) -Raw | ConvertFrom-Json;
    
	#Returne PSCredential as MyAnimeList API doesn't requires anything else for auth
    New-Object -TypeName PSCredential -ArgumentList @($Token.Username, ($Token.PersonalAccessToken | ConvertTo-SecureString));
}
