param(
    [string]$OutputPath = "SisPAT-Apresentacao.pptx",
    [switch]$KeepScreenshots
)

$ErrorActionPreference = "Stop"

$edgeCandidates = @(
    "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
    "C:\Program Files\Microsoft\Edge\Application\msedge.exe",
    "C:\Program Files\Google\Chrome\Application\chrome.exe",
    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
)

$browserPath = $edgeCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $browserPath) {
    throw "Nenhum navegador compatível foi encontrado."
}

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$slides = Get-ChildItem -Path $root -Filter "slide-*.html" | Sort-Object Name
if (-not $slides) {
    throw "Nenhum slide HTML foi encontrado."
}

$resolvedOutput = if ([System.IO.Path]::IsPathRooted($OutputPath)) {
    $OutputPath
} else {
    Join-Path $root $OutputPath
}

$tempRoot = Join-Path $root ".pptx-export-temp"
$imageDir = Join-Path $tempRoot "slides"

if (Test-Path $tempRoot) {
    Remove-Item -Recurse -Force $tempRoot
}

New-Item -ItemType Directory -Path $imageDir | Out-Null

function Export-SlideImage {
    param(
        [string]$HtmlPath,
        [string]$PngPath
    )

    $uri = [System.Uri]::new((Resolve-Path $HtmlPath))
    $arguments = @(
        "--headless"
        "--disable-gpu"
        "--hide-scrollbars"
        "--allow-file-access-from-files"
        "--force-device-scale-factor=2"
        "--window-size=1920,1080"
        "--default-background-color=ffffff"
        "--screenshot=$PngPath"
        $uri.AbsoluteUri
    )

    & $browserPath @arguments | Out-Null

    if (-not (Test-Path $PngPath)) {
        throw "Falha ao gerar captura para $HtmlPath"
    }
}

function New-PowerPointPresentation {
    param(
        [string[]]$Images,
        [string]$DestinationPath
    )

    $ppLayoutBlank = 12
    $ppSaveAsOpenXMLPresentation = 24

    $powerPoint = $null
    $presentation = $null

    try {
        $powerPoint = New-Object -ComObject PowerPoint.Application
        $powerPoint.Visible = -1
        $presentation = $powerPoint.Presentations.Add()

        $presentation.PageSetup.SlideWidth = 960
        $presentation.PageSetup.SlideHeight = 540

        foreach ($image in $Images) {
            $slide = $presentation.Slides.Add($presentation.Slides.Count + 1, $ppLayoutBlank)
            $null = $slide.Shapes.AddPicture($image, $false, $true, 0, 0, $presentation.PageSetup.SlideWidth, $presentation.PageSetup.SlideHeight)
        }

        $presentation.SaveAs($DestinationPath, $ppSaveAsOpenXMLPresentation)
    }
    finally {
        if ($presentation) {
            $presentation.Close()
        }
        if ($powerPoint) {
            $powerPoint.Quit()
        }
    }
}

$images = @()

try {
    foreach ($slide in $slides) {
        $pngName = [System.IO.Path]::ChangeExtension($slide.Name, ".png")
        $pngPath = Join-Path $imageDir $pngName
        Export-SlideImage -HtmlPath $slide.FullName -PngPath $pngPath
        $images += $pngPath
    }

    if (Test-Path $resolvedOutput) {
        Remove-Item -Force $resolvedOutput
    }

    New-PowerPointPresentation -Images $images -DestinationPath $resolvedOutput
    Write-Host "PPTX gerado em: $resolvedOutput"
}
finally {
    if (-not $KeepScreenshots -and (Test-Path $tempRoot)) {
        Remove-Item -Recurse -Force $tempRoot
    }
}
