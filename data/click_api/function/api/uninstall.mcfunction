# click_api v2.1 | api/uninstall
# Datapack'i temizle

# Scoreboard'ları kaldır
scoreboard objectives remove click_api.rc
scoreboard objectives remove click_api.lc_dealt
scoreboard objectives remove click_api.temp
scoreboard objectives remove click_api.debug

# Storage'ları temizle
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

# Başarı mesajı
tellraw @a ["",{"text":"[click_api] ","color":"red","bold":true},{"text":"Uninstalled successfully","color":"white","bold":false}]
