fx_version "cerulean"
games {"gta5"}

name "np-wheelfitment"

ui_page "core/client/ui/html/index.html"

files {"core/client/ui/html/index.html", "core/client/ui/html/js/ui.js", "core/client/ui/html/css/menu.css", "core/client/ui/html/imgs/logo.png"}

client_script "@np-sync/client/lib.lua"
client_script "@np-lib/client/cl_ui.lua"
client_script "@np-lib/client/cl_polyhooks.lua"
client_script "@np-lib/client/cl_rpcother.lua"
client_script "@PolyZone/client.lua"
shared_script "@np-lib/shared/sh_util.lua"
server_script "@np-lib/server/sv_rpcother.lua"
server_script "@np-lib/server/sv_sql.lua"


shared_script "_configs/cfg_general.lua"

client_scripts {"core/client/cl_ply.lua", "core/client/ui/cl_ui.lua"}

server_scripts {"core/server/sv_ply.lua"}

