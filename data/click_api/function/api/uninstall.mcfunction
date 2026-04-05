# click_api v2.4 | api/uninstall

scoreboard objectives remove click_api.rc
scoreboard objectives remove click_api.lc_dealt
scoreboard objectives remove click_api.temp
scoreboard objectives remove click_api.debug
scoreboard objectives remove click_api.cooldown

data remove storage click_api:internal loaded
data remove storage click_api:internal version
data remove storage click_api:internal author
data remove storage click_api:event queue
data remove storage click_api:event current
data remove storage click_api:event history
data remove storage click_api:cmd queue
data remove storage click_api:cmd current
data remove storage click_api:cmd input
data remove storage click_api:cmd multi_temp
data remove storage click_api:cmd give_name
data remove storage click_api:cmd give_data

tellraw @a ["",{"text":"[click_api] ","color":"red","bold":true},{"text":"Uninstalled successfully","color":"white"}]
