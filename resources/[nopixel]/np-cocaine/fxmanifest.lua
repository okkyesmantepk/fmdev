fx_version 'cerulean'
games { 'rdr3', 'gta5' }

client_scripts {
    "@np-lib/client/cl_rpc.lua",
    "@np-lib/client/cl_interface.lua",
    'client/*.lua'
}

server_scripts {
    "@np-lib/server/sv_rpc.lua",
    'server/*.lua'
}
 