sudo_monster = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local monster_dev = io.open("monster_online.lua")
if monster_dev then
monster_on = {string.match(monster_dev:read('*all'), "^(.*)/(%d+)")}
local file_monster = io.open("sudo.lua", 'w')
file_monster:write("token = '" ..monster_on[1].."'\n\nsudo_add = "..monster_on[2].."" )
file_monster:close()
https.request("https://api.telegram.org/bot"..monster_on[1].."/sendMessage?chat_id="..monster_on[2].."&text=Bot_monster_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf monster_online.lua')  
os.execute('./tg -s ./Monster.lua $@ --bot='..monster_on[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ تم جاري تشغيل السورس ...\27[m \27[1;34m»»Now Send Sudo ID««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ تم جاري تشغيل السورس ...\27[m")
local file_monster = io.open("sudo.lua", 'w')
file_monster:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
file_monster:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./Monster.lua $@ --bot='..tokenCk)
else
print("\27[31m»»This TOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
os.execute('cd .. && rm -rf .telegram-cli')
if token and token == "T/M" then 
print("\27[1;34m»»ارسل توكن البوت««\27[m")
local token_send = io.read()
chack(token_send)
else 
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
sudo_monster = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('./tg -s ./Monster.lua $@ --bot='..token)
else
print("\27[31mتوكن البوت غير صحيح قم بارسال توكن اخر««\27[m")
local token_send = io.read()
chack(token_send)
end
end
