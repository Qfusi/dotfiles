Write-Host "`n--- Unbloating Windows ---`n" -ForegroundColor Cyan

$scriptBlock = {

	# Referenced to build script
	# https://docs.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update
	# https://github.com/jayharris/dotfiles-windows/blob/master/windows.ps1#L157
	# https://gist.github.com/jessfraz/7c319b046daa101a4aaef937a20ff41f
	# https://gist.github.com/alirobe/7f3b34ad89a159e6daa1
	# https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/remove-default-apps.ps1
	# https://gist.github.com/mrik23/e8160517b19a3a9dad9c1b5e8ba0fb78

	$applicationList = @(
		"Microsoft.3DBuilder"
		"Microsoft.BingFinance"
		"Microsoft.BingNews"
		"Microsoft.BingSports"
		"Microsoft.BingWeather"
		"Microsoft.Getstarted"
		"Microsoft.GetHelp"
		"Microsoft.MicrosoftSolitaireCollection"
		"Microsoft.Office.OneNote"
		"Microsoft.People"
		"Microsoft.SkypeApp"
		"Microsoft.Windows.Photos"
		"Microsoft.WindowsAlarms"
		"Microsoft.WindowsCamera"
		"microsoft.windowscommunicationsapps"
		"Microsoft.WindowsMaps"
		"Microsoft.WindowsPhone"
		"Microsoft.WindowsSoundRecorder"
		"Microsoft.ZuneMusic"
		"Microsoft.ZuneVideo"
		"Microsoft.AppConnector"
		"Microsoft.ConnectivityStore"
		"Microsoft.Office.Sway"
		"Microsoft.Messaging"
		"Microsoft.CommsPhone"
		"Microsoft.MicrosoftStickyNotes"
		"Microsoft.OneConnect"
		"Microsoft.WindowsFeedbackHub"
		"Microsoft.MinecraftUWP"
		"Microsoft.MicrosoftPowerBIForWindows"
		"Microsoft.NetworkSpeedTest"
		"Microsoft.Microsoft3DViewer"
		"Microsoft.RemoteDesktop"
		"Microsoft.Print3D"
		"Microsoft.FreshPaint"
		"Microsoft.XboxApp"
		"Microsoft.XboxIdentityProvider"
		"Microsoft.XboxSpeechToTextOverlay"
		"Microsoft.XboxGameOverlay"
		"Microsoft.Xbox.TCUI"
		"king.com.CandyCrushSodaSaga"
		"Drawboard.DrawboardPDF"
		"D52A8D61.FarmVille2CountryEscape"
		"GAMELOFTSA.Asphalt8Airborne"
		"flaregamesGmbH.RoyalRevolt2"
		"ActiproSoftwareLLC.562882FEEB491"
		"king.com.BubbleWitch3Saga"
		"89006A2E.AutodeskSketchBook"
		"A278AB0D.DisneyMagicKingdoms"
		"828B5831.HiddenCityMysteryofShadows"
		"*MarchofEmpires*"
		"*Solitaire*"
		"*Autodesk*"
		"*BubbleWitch*"
		"king.com*"
		"G5*"
		"*Facebook*"
		"*Keeper*"
		"*Netflix*"
		"*Twitter*"
		"*Plex*"
		"*.Duolingo-LearnLanguagesforFree"
		"*.EclipseManager"
		"*.AdobePhotoshopExpress"
	)

	function removeApp([string]$app) {
		Write-Host "Removing $app"
		Get-AppxPackage $app -AllUsers | Remove-AppxPackage > $null
		Get-AppXProvisionedPackage -Online | Where-Object DisplayName -like $app | Remove-AppxProvisionedPackage -Online > $null
	}

	$WarningPreference = 'SilentlyContinue'
	Import-Module Appx -UseWindowsPowerShell > $null
	Import-Module DISM -UseWindowsPowerShell > $null
	foreach ($app in $applicationList) {
		removeApp $app
	}
	Remove-Module DISM > $null
	$WarningPreference = 'Continue'
}

Start-Process pwsh -ArgumentList "-Command & { $($scriptBlock -replace '"', '\"' ) }" -Wait -Verb runAs

Write-Host "`n----- Done unbloating windows -----`n" -ForegroundColor Cyan