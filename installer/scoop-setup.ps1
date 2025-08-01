$local = $(Join-Path -Path $HOME -ChildPath .local)

$xdg_config_home = $(Join-Path -Path $HOME -ChildPath .config)
$xdg_cache_home =  $(Join-Path -Path $HOME -ChildPath .cache)
$xdg_data_home =  $(Join-Path -Path $local -ChildPath share)
$xdg_state_home =  $(Join-Path -Path $local -ChildPath state)

[System.Environment]::SetEnvironmentVariable("HOME", $HOME, "User")

[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "$xdg_config_home", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "$xdg_config_home")
[System.Environment]::SetEnvironmentVariable("XDG_CACHE_HOME", "$xdg_cache_home", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CACHE_HOME", "$xdg_cache_home")
[System.Environment]::SetEnvironmentVariable("XDG_DATA_HOME", "$xdg_data_home", "User")
[System.Environment]::SetEnvironmentVariable("XDG_DATA_HOME", "$xdg_data_home")
[System.Environment]::SetEnvironmentVariable("XDG_STATE_HOME", "$xdg_state_home", "User")
[System.Environment]::SetEnvironmentVariable("XDG_STATE_HOME", "$xdg_state_home")

$scoop_top_dir = "C:\scoop"
$scoop_dir = $scoop_top_dir
$scoop_global_dir = $(Join-Path -Path $scoop_top_dir -ChildPath "global")
$scoop_cache_dir = $(Join-Path -Path $scoop_top_dir -ChildPath "cache")

New-Item "$scoop_dir" -ItemType Directory -ErrorAction SilentlyContinue
New-Item "$scoop_global_dir" -ItemType Directory -ErrorAction SilentlyContinue
New-Item "$scoop_cache_dir" -ItemType Directory -ErrorAction SilentlyContinue

$scoop_bin = $(Join-Path -Path $scoop_dir -ChildPath shims)

$path = $scoop_bin + ";" + $Env:Path

[System.Environment]::SetEnvironmentVariable("Path", "$path", "User")
[System.Environment]::SetEnvironmentVariable("Path", "$path")

$working_dir = $(Join-Path -Path $home -ChildPath tmp)

New-Item "$working_dir" -ItemType Directory -ErrorAction SilentlyContinue

$current_working_dir = $(Get-Location)
cd $working_dir
irm get.scoop.sh -outfile 'install.ps1'

./install.ps1 -ScoopDir $scoop_dir -ScoopGlobalDir $scoop_global_dir -ScoopCacheDir $scoop_cache_dir

cd $current_working_dir
