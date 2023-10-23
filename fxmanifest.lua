game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

client_scripts {'client/*.lua'}
server_scripts {'server/*.lua', '@oxmysql/lib/MySQL.lua'}
shared_scripts {'@ox_lib/init.lua'}

files {'html/index.html', 'html/script/*.js', 'html/style/*.css', 'html/images/*.png', 'html/style/*.ttf'}

ui_page 'html/index.html'
