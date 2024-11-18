fx_version 'cerulean'
game 'gta5'

author 'niomeV2'
version '1.0.0'

lua54 'yes'

shared_script {
    '@qb-core/shared/locale.lua',
    '@ox_lib/init.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

client_scripts {
    'client/modules/utils.lua',
    'client/main.lua'
}

server_scripts {
    'server/*.lua'
}