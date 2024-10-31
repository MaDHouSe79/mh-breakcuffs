fx_version 'cerulean'
games {'gta5'}

author 'MaDHouSe'
description 'MH Break Cuffs'
version '1.0.0'

shared_scripts {
  '@qb-core/shared/locale.lua',
  'locales/en.lua', -- change en to your language
  'config.lua',
}

client_scripts {'client/main.lua'}
server_scripts {'server/update.lua'}

dependencies {'qb-core', 'qb-policejob'}
lua54 'yes'
