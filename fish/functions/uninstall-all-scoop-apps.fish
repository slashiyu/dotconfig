function uninstall-all-scoop-apps
for i in $(scoop list | tail -n +5 | sed -e '/^$/d' | awk '{print $1}'|tac); scoop uninstall $i; end
end
