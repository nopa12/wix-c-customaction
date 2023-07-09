$zipUrl = "https://github.com/wixtoolset/wix3/releases/download/wix3112rtm/wix311-binaries.zip"
$zipFilePath = "$PWD\wix311-binaries.zip"
$extractPath = "$PWD\wix311-binaries"

if (Test-Path -Path $extractPath) {
    Write-Host "wix311-binaries Directory already exists. Skipping download."
} else {
    # Download the ZIP file
    Write-Host "Downloading wix toolset wix311-binaries..."
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipFilePath
    
    Write-Host "Unpacking ZIP file..."
    Expand-Archive -Path $zipFilePath -DestinationPath $extractPath
}

# clear old stuff
if (Test-Path -Path "build") {
    Write-Host "Clear old build dir..."
    Remove-Item -Path "build" -Recurse -Force
}

# Build objects
$candleParams = "-nologo -v -arch x64 -ext WixUtilExtension -ext WixUIExtension "`
                + "-dProjectDir=app "`
                + "-dPlatform=x64 "`
                + "-out build\ "`
                + "src\Product.wxs "`

Start-Process -NoNewWindow -FilePath wix311-binaries\candle.exe -ArgumentList $candleParams -Wait

# Create MSI
$lightParams =  "-nologo -v -ext WixUIExtension -ext WixUtilExtension "`
                + '-b "images=src\images" '`
                + '-out "build\out.msi" '`
                + 'build\Product.wixobj '`

Start-Process -NoNewWindow -FilePath wix311-binaries\light.exe -ArgumentList $lightParams -Wait