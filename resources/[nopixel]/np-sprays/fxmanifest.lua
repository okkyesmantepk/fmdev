fx_version 'bodacious'
game 'gta5'

description 'Ghost.'

version '1.1.0'

client_scripts {
	'config.lua',
	'client/*.lua',
}

server_scripts {
	'config.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/sv_*.lua',

}