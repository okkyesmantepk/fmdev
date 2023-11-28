fx_version "cerulean"
games { "gta5" }


client_scripts {
    "@np-sync/client/lib.lua",
    '@np-lib/client/cl_interface.lua',
    "@np-lib/client/cl_polyhooks.lua",
    "@np-locales/client/lib.lua",
    "@np-lib/client/cl_rpc.lua",
    "client/*",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua", 
    "@np-lib/server/sv_rpc.lua",
    "server/*",
}


shared_scripts {
    "shared/*",
} 
