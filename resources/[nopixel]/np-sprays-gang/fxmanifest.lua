fx_version "cerulean"

description "Sprays"
author "Nopixel"
version '0.0.1'

game "gta5"

this_is_a_map 'yes'

client_script {
    '@np-lib/client/cl_interface.js',
    '@np-lib/client/cl_rpc.js',
    'client/*.js',
    'client/*.lua'
}

server_script {
    '@np-lib/server/sv_rpc.js',
    '@np-lib/server/sv_rpc.lua',
    '@np-lib/server/sv_sql.js',
    'server/*.js',
    'server/*.lua'
}

data_file 'DLC_ITYP_REQUEST' 'stream/durp_misc_load.ytyp'