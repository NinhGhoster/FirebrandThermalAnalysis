$ErrorActionPreference = "Stop"

# Package Windows installer using Inno Setup (iscc).
# Requires Inno Setup installed and ISCC available in PATH,
# or set $env:ISCC_PATH to the full path of ISCC.exe.

$Iscc = $env:ISCC_PATH
if (-not $Iscc) { $Iscc = "iscc" }

& $Iscc "build\\installer_windows.iss"
Write-Host "Installer created in dist\\"
