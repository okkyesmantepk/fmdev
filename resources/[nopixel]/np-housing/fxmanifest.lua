fx_version "cerulean"
games { "gta5" }

client_script "@np-lib/client/cl_interface.lua"

shared_scripts {
	"@np-lib/shared/sh_util.lua",
	"shared/*",
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	"@np-lib/server/sv_rpc.lua",
    "server/*",
}

client_scripts {
	'@np-lib/client/cl_ui.lua',
	"@np-lib/client/cl_rpc.lua",
	"client/*",
}