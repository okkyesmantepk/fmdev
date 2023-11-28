fx_version 'cerulean'
games { 'gta5' }

client_scripts {
  '@np-lib/client/cl_rpc.lua',
  'client/cl_*.lua',
}

server_scripts {
  '@np-lib/server/sv_sqlother.lua',
  '@np-lib/server/sv_rpc.lua',
  '@np-lib/server/sv_rpc.js',
  '@np-lib/server/sv_sql.lua',
  '@np-lib/server/sv_sql.js',
  'server/sv_*.lua',
}
