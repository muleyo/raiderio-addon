# https://warcraft.wiki.gg/wiki/TOC_format#Warcraft_Wiki
# https://wowpedia.fandom.com/wiki/TOC_format#Wowpedia

$clients = [ordered]@{
	Mainline = @{
		Interface = 100200
		Version = "10.2.0"
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

$nonMainlineClients = @()

for ($i = 0; $i -lt $clients.Values.Count; $i++)
{
	$clientInfo = $clients.Values[$i]
	$clientInfo.IsMainline = $i -eq 0
	if (-not $clientInfo.IsMainline)
	{
		$nonMainlineClients += $clientInfo
	}
}

$rootPath = $PSScriptRoot
$dbRootPath = Join-Path $rootPath "db"

$sharedClientFiles = @()
$coreXml = [xml](Get-Content -Path (Join-Path $rootPath "core.xml"))

foreach ($xmlScript in $coreXml.Ui.Script)
{
	$xmlFile = $xmlScript.file
	if (-not $xmlFile.StartsWith("db/db_"))
	{
		continue
	}
	$sharedClientFiles += $xmlFile.Split("/", 2)[1]
}

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

function ClientFilePrefix
{
	param(
		$clientInfo
	)
	if ($clientInfo.IsMainline)
	{
		return "db"
	}
	else
	{
		return "db_$($clientInfo.Name)"
	}
}

function ClientTocCanLoadFile
{
	param(
		$clientInfo,
		[string]$file
	)
	if ($sharedClientFiles.Contains($file))
	{
		return $false
	}
	$clientFilePrefix = ClientFilePrefix $clientInfo
	foreach ($clientKey in $clients.Keys)
	{
		$otherClientInfo = $clients[$clientKey]
		if ($otherClientInfo.IsMainline -or $otherClientInfo -eq $clientInfo)
		{
			continue
		}
		$otherClientFilePrefix = ClientFilePrefix $otherClientInfo
		$otherFilePrefix = "$($otherClientFilePrefix)_"
		if ($file.StartsWith($otherFilePrefix))
		{
			return $false
		}
	}
	foreach ($typeValue in $types.Values)
	{
		$typeText = EscapeText $typeValue
		$filePrefix = "$($clientFilePrefix)_$($typeText)_"
		if ($file.StartsWith($filePrefix))
		{
			return $false
		}
	}
	return $true
}

foreach ($clientKey in $clients.Keys)
{

	$clientInfo = $clients[$clientKey]
	$clientVersion = $clientInfo.Version

	$clientTocFile = if ($clientInfo.IsMainline) { "$($meta.AddOn).toc" } else { "$($meta.AddOn)_$($clientKey).toc" }
	$clientTocFilePath = Join-Path $rootPath $clientTocFile
	$clientFilePrefix = ClientFilePrefix $clientInfo
	$clientFiles = Get-ChildItem $dbRootPath -Filter "$($clientFilePrefix)_*.lua"
	$clientTocLines = BuildTocLines $meta.TOC $clientInfo.Interface
	foreach ($clientFile in $clientFiles)
	{
		if (ClientTocCanLoadFile $clientInfo $clientFile.Name)
		{
			$clientTocLines += "db/$($clientFile.Name)"
		}
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

			$db1 = "$($clientFilePrefix)_$($typeText)_$($regionText)_characters.lua"
			$db2 = "$($clientFilePrefix)_$($typeText)_$($regionText)_lookup.lua"

			$db1Path = Join-Path $dbRootPath $db1
			$db2Path = Join-Path $dbRootPath $db2
			$dbMissing = -not (Test-Path $db1Path) -or -not (Test-Path $db2Path)

			$dbFolderName = "$($meta.AddOn)_DB_$($regionKey)_$($typeKey)"
			$dbFolderPath = Join-Path $dbRootPath $dbFolderName
			$tocFile = if ($clientInfo.IsMainline) { "$($dbFolderName).toc" } else { "$($dbFolderName)_$($clientKey).toc" }
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
