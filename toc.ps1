# https://warcraft.wiki.gg/wiki/TOC_format#Warcraft_Wiki
# https://wowpedia.fandom.com/wiki/TOC_format#Wowpedia

$clients = @{
	Mainline = @{
		Interface = 100107
		Version = "10.1.7"
		Name = "mainline"
	}
	Wrath = @{
		Interface = 30403
		Version = "3.4.2"
		Name = "classic"
	}
	Classic = @{
		Interface = 11404
		Version = "1.14.4"
		Name = "era"
	}
}

$meta = @{
	AddOn = "RaiderIO"
}

$meta.TOC = [ordered]@{
	Title = "Raider.IO Mythic Plus, Raiding, and Recruitment"
	Notes = "Shows Raider.IO Mythic+ Score, Raid Progress, and Recruitment status in-game. Make sure to load one or more region DB."
	Author = "Vladinator (Vladinator-TarrenMill), Aspyr (Aspyrox-Skullcrusher) and Isak (Isak-Sargeras)"
	Version = "@clientVersion@ (@project-version@)"
	IconTexture = "Interface\AddOns\$($meta.AddOn)\icons\logo"
	SavedVariables = "RaiderIO_Config, RaiderIO_LastCharacter, RaiderIO_MissingCharacters, RaiderIO_MissingServers, RaiderIO_CachedRuns, RaiderIO_RWF, RaiderIO_CompletedReplays"
	"X-Website" = "https://raider.io"
	"X-AddonProvider" = "github"
	"X-Curse-Project-ID" = "279257"
	"X-Wago-ID" = "b6mb0XKP"
}

$meta.DBTOC = [ordered]@{
	Title = "Raider.IO |cffFFFFFF@typeName@|r (@regionName@)"
	Author = "$($meta.TOC.Author)"
	Version = "$($meta.TOC.Version)"
	IconTexture = "$($meta.TOC.IconTexture)"
	Dependencies = "$($meta.AddOn)"
	DefaultState = "enabled"
	"X-Type" = "@typeName@"
	"X-Region" = "@regionName@"
	"X-Faction" = "Both"
	"X-Website" = "https://raider.io"
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

$rootPath = $PSScriptRoot
$dbRootPath = Join-Path $rootPath "db"

function EscapeText
{
	param(
		[string]$text
	)
	return $text.ToLower().Replace(" ", "")
}

function EvalText
{
	param(
		[string]$text
	)
	$allMatches = Select-String -InputObject $text -Pattern "@([^@]+?)@" -AllMatches
	foreach ($matches in $allMatches)
	{
		foreach ($match in $matches.Matches)
		{
			$variableName = $match.Groups[1].Value
			$value = Get-Variable -Name $variableName -Scope Script -ValueOnly -ErrorAction SilentlyContinue
			if ($null -eq $value)
			{
				continue
			}
			$raw = $match.Groups[0].Value
			$text = $text -replace $raw, $value
		}
	}
	return $text
}

function BuildTocLines
{
	param(
		$TOC,
		[string]$Interface
	)
	$tocLines = @("## Interface: $($Interface)")
	foreach ($k in $TOC.Keys)
	{
		$v = $TOC[$k]
		$v = EvalText $v
		$tocLines += "## $($k): $($v)"
	}
	return $tocLines
}

function IsClientFile
{
	param(
		[string]$client,
		[string]$file
	)
	foreach ($typeValue in $types.Values)
	{
		$text = EscapeText $typeValue
		if ($file.StartsWith("db_$($client)_$($text)_"))
		{
			return $false
		}
	}
	return $true
}

foreach ($clientKey in $clients.Keys)
{

	$isMainline = $clientKey -eq "Mainline"
	$clientInfo = $clients[$clientKey]
	$clientVersion = $clientInfo.Version

	$clientTocFile = if ($isMainline) { "$($meta.AddOn).toc" } else { "$($meta.AddOn)_$($clientKey).toc" }
	$clientTocFilePath = Join-Path $rootPath $clientTocFile
	$clientFiles = Get-ChildItem $dbRootPath -Filter "db_$($clientInfo.Name)_*.lua"
	$clientTocLines = BuildTocLines $meta.TOC $clientInfo.Interface
	foreach ($clientFile in $clientFiles)
	{
		if (-not (IsClientFile $clientInfo.Name $clientFile.Name))
		{
			continue
		}
		$clientTocLines += "db/$($clientFile.Name)"
	}
	$clientTocLines += "core.xml"
	$clientTocText = $clientTocLines -join "`r`n"
	Set-Content $clientTocFilePath $clientTocText

	foreach ($regionKey in $regions.Keys)
	{

		$regionName = $regions[$regionKey]
		$regionText = EscapeText $regionKey

		foreach ($typeKey in $types.Keys)
		{

			$typeName = $types[$typeKey]
			$typeText = EscapeText $typeName

			$db1 = "db_$($clientInfo.Name)_$($typeText)_$($regionText)_characters.lua"
			$db2 = "db_$($clientInfo.Name)_$($typeText)_$($regionText)_lookup.lua"

			$db1Path = Join-Path $dbRootPath $db1
			$db2Path = Join-Path $dbRootPath $db2
			$dbMissing = -not (Test-Path $db1Path) -or -not (Test-Path $db2Path)

			$dbFolderName = "$($meta.AddOn)_DB_$($regionKey)_$($typeKey)"
			$dbFolderPath = Join-Path $dbRootPath $dbFolderName
			$tocFile = if ($isMainline) { "$($dbFolderName).toc" } else { "$($dbFolderName)_$($clientKey).toc" }
			$tocFilePath = Join-Path $dbRootPath $dbFolderName $tocFile

			if (-not (Test-Path $dbFolderPath))
			{
				$null = New-Item $dbFolderPath -ItemType Directory
			}

			$tocLines = BuildTocLines $meta.DBTOC $clientInfo.Interface

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
