fx_version 'cerulean'
games { 'gta5' }

client_script "@np-errorlog/client/cl_errorlog.lua"
client_script "@np-lib/client/cl_ui.lua" 

client_scripts {
  'client/cl_*.lua',
  '@np-lib/client/cl_rpc.lua',
}

shared_script {
  'sh_config.lua',
}

server_scripts {
  '@np-lib/server/sv_rpc.lua',
  'server/sv_*.lua',
}

ui_page "ui/index.html"

files({
    "ui/index.html",
    "ui/js/*.js",
    "ui/css/*.css",
})