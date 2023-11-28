fx_version 'adamant'
games { 'gta5' }

client_script {
    '@np-lib/client/cl_rpc.lua',
	'@np-lib/client/cl_ui.lua',
	'@np-lib/client/cl_interface.lua',
    '@np-lib/client/cl_ui.js',
    'client/cl_*.lua'
}

server_script {
    '@np-lib/server/sv_rpc.lua',
    'server/sv_*.lua'
}

exports {
    'canHandOffPackages'
}