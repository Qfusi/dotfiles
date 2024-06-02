Write-Host "`n----- Configuring windows -----`n" -ForegroundColor Cyan

$scriptBlock = {
	#--- Windows Features ---

	# # Enables exporer options
	# Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions
	# # will expand explorer to the actual folder you're in
	# Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
	# # Adds things back in your left pane like recycle bin
	# Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
	# # Opens PC to This PC, not quick access
	# Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
	# # Taskbar where window is open for multi-monitor
	# Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2

	# Create AppModelUnlock if it doesn't exist, required for enabling Developer Mode
	$RegistryKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
	if (-not(Test-Path -Path $RegistryKeyPath)) {
		New-Item -Path $RegistryKeyPath -ItemType Directory -Force | Out-Null
	}
	# Add registry value to enable Developer Mode
	New-ItemProperty -Path $RegistryKeyPath -Name AllowDevelopmentWithoutDevLicense -PropertyType DWORD -Value 1 -Force

	# Disables suggested apps in the start menu
	Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SystemPaneSuggestionsEnabled -Type DWord -Value 0

	# Disable Telemetry
	Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -Type DWord -Value 0
	Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection -Name AllowTelemetry -Type DWord -Value 0
	Set-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -Type DWord -Value 0

	# Disable Wi-Fi Sense
	If (!(Test-Path HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting)) {

		New-Item -Path HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Force | Out-Null
	}
	Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting -Name "Value" -Type DWord -Value 0
	Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots -Name "Value" -Type DWord -Value 0

	# Disable Bing Search in Start Menu
	Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name BingSearchEnabled -Type DWord -Value 0

	$RegistryKeyPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
	If (!(Test-Path -Path $RegistryKeyPath)) {
		New-Item -Path $RegistryKeyPath -Force | Out-Null
	}
	Set-ItemProperty -Path $RegistryKeyPath -Name DisableWebSearch -Type DWord -Value 1

	# Disable Xbox gaming features
	Set-ItemProperty -Path HKCU:\System\GameConfigStore -Name GameDVR_Enabled -Type DWord -Value 0
	If (!(Test-Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR)) {
		New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR | Out-Null
	}
	Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR -Name AllowGameDVR -Type DWord -Value 0
}

Start-Process pwsh -ArgumentList "-Command & { $($scriptBlock -replace '"', '\"' ) }" -Wait -Verb runAs

Write-Host "`n----- Done configuring windows -----`n" -ForegroundColor Cyan