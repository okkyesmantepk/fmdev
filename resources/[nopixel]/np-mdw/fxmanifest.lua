fx_version "cerulean"

description "Void - MDW"
author "cool"
version '0.0.1'

lua54 'yes'

game "gta5"

ui_page 'web/build/index.html'

client_scripts {
  "@np-lib/client/cl_rpc.lua",
  'client/cl_utils.lua',
  'client/cl_*.lua'
}

server_scripts {
  "@np-lib/server/sv_rpc.lua",
  "@np-lib/server/sv_sql.lua",
  "server/sv_*.lua"
}

files {
  'web/build/index.html',
  'web/build/**/*'
}