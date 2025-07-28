$home = "$Env:USERPROFILE"
$local = $(Join-Path -Path $home -ChildPath .local)

$xdg_config_home = $(Join-Path -Path $home -ChildPath .config)
$xdg_cache_home =  $(Join-Path -Path $home -ChildPath .cache)
$xdg_data_home =  $(Join-Path -Path $local -ChildPath share)
$xdg_state_home =  $(Join-Path -Path $local -ChildPath state)

[System.Environment]::SetEnvironmentVariable("HOME", "$home", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME",  "$xdg_config_home", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CACHE_HOME",  "$xdg_cache_home", "User")
[System.Environment]::SetEnvironmentVariable("XDG_DATA_HOME",  "$xdg_data_home", "User")
[System.Environment]::SetEnvironmentVariable("XDG_STATE_HOME",  "$xdg_state_home", "User")

$scoop_top_dir = "C:\scoop"
$scoop_dir = $scoop_top_dir
$scoop_global_dir = $(Join-Path -Path $scoop_top_dir -ChildPath "global")
$scoop_cache_dir = $(Join-Path -Path $scoop_top_dir -ChildPath "cache")

# $scoop_dir = $(Join-Path -Path $home -ChildPath scoop)
$scoop_bin = $(Join-Path -Path $scoop_dir -ChildPath shims)

$path = $scoop_bin + ";" + $Env:Path

[System.Environment]::SetEnvironmentVariable("Path", "$path", "User")

$working_dir = $(Join-Path -Path $home -ChildPath tmp)

New-Item "$working_dir" -ItemType Directory -ErrorAction SilentlyContinue

cd $working_dir
irm get.scoop.sh -outfile 'install.ps1'

./install.ps1 -ScoopDir $scoop_dir -ScoopGlobalDir $scoop_global_dir -ScoopCacheDir $scoop_cache_dir

