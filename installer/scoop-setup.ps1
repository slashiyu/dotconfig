
$working_dir = "~/tmp"
$scoop_top_dir = "C:/msys64/opt/scoop"
$scoop_dir = $scoop_top_dir + "/root"
$scoop_global_dir = $scoop_top_dir + "/global"
$scoop_cache_dir = $scoop_top_dir + "/cache"

cd $working_dir
irm get.scoop.sh -outfile 'install.ps1'

./install.ps1 -ScoopDir $scoop_dir -ScoopGlobalDir $scoop_global_dir -ScoopCacheDir $scoop_cache_dir
