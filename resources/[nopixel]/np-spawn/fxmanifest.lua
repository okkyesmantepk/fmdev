fx_version 'cerulean'
games {'gta5'}

client_script "@np-lib/client/cl_interface.lua"

ui_page "html/index.html"
files({
	"html/*",
	"html/images/*",
	"html/css/*",
	"html/webfonts/*",
	"html/js/*"
})


client_script '@np-lib/client/cl_rpc.lua'
client_script "client/*"

server_script '@np-lib/server/sv_rpc.lua'
server_script '@np-lib/server/sv_sql.lua'
server_script '@np-lib/server/sv_sql.js'

shared_script "shared/sh_spawn.lua" 
server_script "server/*"

lua54 'yes'