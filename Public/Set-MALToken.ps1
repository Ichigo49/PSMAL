function Set-MALToken {
    <#
    .Synopsis
    Function that set the username and password from the user.

    .Notes
    Created by Mathieu ALLEGRET <mathieu.allegret@gmail.com>
    #>
    [CmdletBinding()]
    param (
    )

    ### TODO: Consider using Read-Host to support non-GUI scenarios
    $MALCredential = Get-Credential -Message 'Please enter your MyAnimeList username and password.' -UserName '<MyAnimeListUsername>';

    $TokenPath = '{0}\token.json' -f (Split-Path -Path $MyInvocation.MyCommand.Module.Path -Parent);

    @(@{
        Username = $MALCredential.UserName;
        PersonalAccessToken = $MALCredential.Password | ConvertFrom-SecureString;
    }) | ConvertTo-Json | Out-File -FilePath $TokenPath;
}
