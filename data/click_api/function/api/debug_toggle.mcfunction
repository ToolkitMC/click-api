# click_api v2.0 | api/debug_toggle
# Debug modunu aç/kapat (Skorboard yöntemi - en stabil)

# Skorboard yoksa oluştur (bir kereye mahsus)
scoreboard objectives add click_api.debug dummy

# Toggle yap (0 ↔ 1 arası çevir)
scoreboard players add @s click_api.debug 1
execute if score @s click_api.debug matches 2.. run scoreboard players set @s click_api.debug 0

# Skora göre tag ekle/kaldır
execute if score @s click_api.debug matches 1 run tag @s add click_api.debug
execute if score @s click_api.debug matches 0 run tag @s remove click_api.debug

# Mesaj göster
execute if score @s click_api.debug matches 1 run tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"Debug mode: ","color":"white"},{"text":"ON","color":"green","bold":true}]
execute if score @s click_api.debug matches 0 run tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"Debug mode: ","color":"white"},{"text":"OFF","color":"red","bold":true}]
