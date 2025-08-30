--[[ ===================================================== ]] --
--[[                MH Cuffed by MaDHouSe79                ]] --
--[[ ===================================================== ]] --
fx_version 'cerulean'
game 'gta5'

description 'MH - Cuffed'
author 'MaDHouSe79'
version '1.0.0'

shared_scripts {
	'@ox_lib/init.lua',
	'locales/locale.lua',
	'locales/en.lua',
	'locales/*.lua',
    'shared/peds.lua',
    'shared/vehicles.lua',
}

client_scripts {
    'core/framework/client.lua',
    'core/functions/client/suspect.lua',
    'core/functions/client/cop.lua',
    'client/main.lua',
}

server_scripts {
    'core/framework/server.lua',
    'core/functions/server/data.lua',
    'server/sv_config.lua',
    'server/main.lua',
    'server/update.lua'
}

lua54 'yes'