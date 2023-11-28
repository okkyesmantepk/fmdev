fx_version "cerulean"
description "AdminUI"
version '0.0.1'
game "gta5"

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    '@np-lib/server/sv_sqlother.lua',
    '@np-lib/server/sv_rpc.lua',
    '@np-lib/server/sv_rpc.js',
    '@np-lib/server/sv_sql.lua',
    '@np-lib/server/sv_sql.js',
    'dist/server/*.js',
    'dist/server/*.lua',
    'server/sv_*.lua'
}

client_scripts {
    '@np-lib/client/cl_rpc.js',
    '@np-lib/client/cl_rpc.lua',
    '@np-lib/client/cl_poly.js',
    'dist/client/*.js',
    'dist/client/*.lua',
    'client/cl_*.lua',
}