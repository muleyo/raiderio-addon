$meta = @{
	AddOn = "RaiderIO"
	Author = "Vladinator (Vladinator-TarrenMill), Aspyr (Aspyrox-Skullcrusher) and Isak (Isak-Sargeras)"
}

$clients = @{
	Mainline = 100107
	Wrath = 30403
	Classic = 11404
}

$regions = @{
	EU = "Europe"
	KR = "Korea"
	TW = "Taiwan"
	US = "Americas"
}

$types = @{
    M = "Mythic Plus"
    R = "Raiding"
    F = "Recruitment"
}

function EscapeText
{
	param(
		[string]$text
	)
	return $text.ToLower().Replace(" ", "")
}

foreach ($clientKey in $clients.Keys)
{

	$clientVersion = $clients[$clientKey]
	$clientText = EscapeText $clientKey

	foreach ($regionKey in $regions.Keys)
	{

		$regionName = $regions[$regionKey]
		$regionText = EscapeText $regionKey

		foreach ($typeKey in $types.Keys)
		{

			$typeName = $types[$typeKey]
			$typeText = EscapeText $typeName

			$db1 = "db_$($clientText)_$($typeText)_$($regionText)_characters.lua"
			$db2 = "db_$($clientText)_$($typeText)_$($regionText)_lookup.lua"

			$db1Path = Join-Path $PSScriptRoot $db1
			$db2Path = Join-Path $PSScriptRoot $db2
			$dbMissing = -not (Test-Path $db1Path) -or -not (Test-Path $db2Path)

			$dbFolderName = "$($meta.AddOn)_DB_$($regionKey)_$($typeKey)"
			$dbFolderPath = Join-Path $PSScriptRoot $dbFolderName
			$tocFile = "$($dbFolderName)_$($clientKey).toc"
			$tocFilePath = Join-Path $PSScriptRoot $dbFolderName $tocFile

			if (-not (Test-Path $dbFolderPath))
			{
				$null = New-Item $dbFolderPath -ItemType Directory
			}

			$tocLines = @(
				"## Interface: $($clientVersion)"
				"## Title: Raider.IO |cffFFFFFF$($typeName)|r ($($regionName))"
				"## Author: $($meta.Author)"
				"## Dependencies: $($meta.AddOn)"
				"## DefaultState: enabled"
				"## IconTexture: Interface\AddOns\$($meta.AddOn)\icons\logo"
				"## X-Type: $($typeName)"
				"## X-Region: $($regionName)"
				"## X-Faction: Both"
				"## X-Website: https://raider.io"
			)

			if (-not $dbMissing)
			{
				$tocLines += @(
					"../$($meta.AddOn)/db/$($db1)"
					"../$($meta.AddOn)/db/$($db2)"
				)
			}

			$tocText = $tocLines -join "`r`n"
			Set-Content $tocFilePath $tocText

		}

	}

}
