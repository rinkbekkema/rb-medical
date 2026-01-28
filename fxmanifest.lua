fx_version '1.0.0'
game 'gta5'

author 'Renewed Builds'

description 'rb-medical (ESX Medical + Ambulance)'
version '1.0.0'

ox_lib 'locale'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/main.lua',
    'shared/compat.lua',
    'shared/inventory.lua',
    'config/shared.lua',
    'config/client.lua',
    'config/server.lua'
}

client_scripts {
    'client/**/*.lua'
}

server_scripts {
    'server/**/*.lua'
}

dependencies {
    'es_extended',
    'ox_lib',
    'qs-inventory',
}

lua54 'yes'
