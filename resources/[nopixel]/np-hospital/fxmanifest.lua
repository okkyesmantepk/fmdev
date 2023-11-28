resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	'config.lua',
    '@np-lib/client/cl_rpc.lua',
    '@np-lib/client/cl_interface.lua',
    '@np-lib/client/cl_animTask.lua',
	'client/client.lua',
	'client/cl_events.lua',
}

server_scripts {
	'server.lua'
}

exports {
    'IsInjuredOrBleeding',
	'DoLimbAlert',
	'DoBleedAlert',
}

server_exports {
    'GetCharsInjuries',
}

fx_version 'adamant'
games { 'gta5' }