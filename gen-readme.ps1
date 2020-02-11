$result = "# Personal Scoop bucket

[![Build status](https://ci.appveyor.com/api/projects/status/sdwq9tekqddjawo7/branch/master?svg=true)](https://ci.appveyor.com/project/iquiw/scoop-bucket/branch/master)

## Applications

| Name | Description |
| ---  | ---         |
"

$files = Get-ChildItem bucket

foreach ($file in $files) {
    $path = Join-Path -Path "bucket" -ChildPath $file
    $name = $file -replace "\.json$", ""
    $json = Get-Content $path | ConvertFrom-Json
    $homepage = $json.homepage
    $descr = $json.description
    $result += "| [$name]($homepage) | $descr |`r`n"
}

$result | Set-Content README.md
