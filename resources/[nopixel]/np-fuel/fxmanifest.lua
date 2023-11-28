game 'gta5'
fx_version 'adamant'
lua54 'yes'


server_script '@np-lib/server/sv_rpc.lua'
server_script 'sv_main.lua'
client_script "@np-lib/client/cl_interface.lua"

client_script {
    '@np-lib/client/cl_rpc.lua',
    '@np-lib/client/cl_ui.lua',
    'cl_main.lua',
    'config.lua'
}
