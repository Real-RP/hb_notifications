
description 'Notification system of hb (real-hamburger)'

ui_page 'html/index.html'

client_scripts {
	'config.lua',
    'main.lua'
} 

server_scripts {
    's_main.lua'
} 


files {
    'html/index.html',
    'html/style.css',
    'html/listener.js',
    'html/sound/notification.ogg',
    'html/fonts/pdown.ttf'
}
