function Invoke-MALApi {
    <#
        .Synopsis
            An internal function that is responsbile for invoking various MyAnimeList REST methods.

        .Parameter Method
            The HTTP method that will be used for the request.

        .Parameter RestMethod
            This parameter is a mandatory parameter that specifies the URL part, after the API's DNS name, that
            will be invoked. By default, all

        .Notes
            Created by Mathieu ALLEGRET <mathieu.allegret@gmail.com>
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string] $Method = 'Get',
        [Parameter(Mandatory = $true)]
        [string] $RestMethod,
        [Parameter(Mandatory = $false)]
        [string] $Body
    )

    ### TODO: Truncate leading forward slashes for the -RestMethod parameter value.

    ### Build the REST API parameters as a HashTable for PowerShell Splatting (look it up, it's easy)
    $ApiRequest = @{
        Uri = 'https://myanimelist.net/api/{0}' -f $RestMethod;
        Method = $Method;
        Credential = Get-MALToken
    }
    
    Write-Verbose -Message ('Invoking the REST method: {0}' -f $ApiRequest.Uri)

    ### Invoke the REST API
    Invoke-RestMethod @ApiRequest;
}