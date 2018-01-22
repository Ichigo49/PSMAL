function Find-MALAnime {
    <#
    .Synopsis
        Function that search an anime in MAL database.

    .Notes
        Created by Mathieu ALLEGRET <mathieu.allegret@gmail.com>
    #>
    param(
        # Parameter help description
        [Parameter(Mandatory)]
        [string]
        $Query
    )

    if ($Query.Contains(" ") -eq $true) {
        $Query = $Query.Replace(" ","+")
    }

    $Result = Invoke-MALApi -RestMethod "anime/search.xml?q=$Query"
    $Result.anime.entry
}