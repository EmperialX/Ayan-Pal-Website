# Define the URLs of the JavaScript files
$urls = @(
    "https://web-static.archive.org/_static/js/bundle-playback.js?v=2mqEsuX0",
    "https://web-static.archive.org/_static/js/wombat.js?v=txqj7nKC",
    "https://web.archive.org/web/20201101025118/https://www.googletagmanager.com/gtm.js",
    "https://web.archive.org/web/20201101025118js_/https://code.jquery.com/jquery-3.5.1.min.js",
    "https://web.archive.org/web/20201101025118js_/https://rupikaur.com/wp-content/cache/minify/c299b.js",
    "https://web.archive.org/web/20201101025118js_/https://rupikaur.com/wp-content/cache/minify/c7035.js",
    "https://web.archive.org/web/20201101025118js_/https://rupikaur.com/wp-content/cache/minify/e922a.js",
    "https://web.archive.org/web/20201101025118js_/https://rupikaur.com/wp-content/cache/minify/f60ea.js",
    "https://web.archive.org/web/20201101025118js_/https://rupikaur.com/wp-content/cache/minify/9f110.js",
    "https://web.archive.org/web/20201101025118js_/https://rupikaur.com/wp-content/cache/minify/dd3df.js",
    "https://web.archive.org/web/20201101025118js_/https://rupikaur.com/wp-content/cache/minify/1c488.js"
)

# Create the js directory if it doesn't exist
$jsDirectory = "js"
if (-Not (Test-Path -Path $jsDirectory)) {
    New-Item -ItemType Directory -Path $jsDirectory
}

# Download each JavaScript file
foreach ($url in $urls) {
    $fileName = [System.IO.Path]::GetFileName($url)
    $outputPath = Join-Path -Path $jsDirectory -ChildPath $fileName
    Invoke-WebRequest -Uri $url -OutFile $outputPath
    Write-Output "Downloaded $url to $outputPath"
}