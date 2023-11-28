fx_version "cerulean"
games { "gta5" }

shared_script {
    "@np-lib/shared/sh_util.lua",
    "shared/*",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "@np-lib/server/sv_rpc.lua",
    "server/*",
}

client_scripts {
    "@np-lib/client/cl_rpc.lua",
    "@np-lib/client/cl_interface.lua",
    "@np-sync/client/lib.lua",
    "@np-lib/client/cl_polyhooks.lua",
    "@np-locales/client/lib.lua",
    "client/*.lua",
}