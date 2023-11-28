fx_version "cerulean"
games { "gta5" }

shared_script {
    "@np-lib/shared/sh_util.lua",
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
    "@np-sync/client/cl_lib.lua",
    "client/*",
}

shared_scripts {
    "@np-lib/shared/sh_util.lua",
}

exports {
    'GetVehicleTable',
    'SetVehicleMods',
}