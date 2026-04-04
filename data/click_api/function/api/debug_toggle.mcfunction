# click_api v2.0 | api/debug_toggle
# Debug mode'u aç/kapat
# @context: @s = debug modunu değiştirmek isteyen oyuncu

# Tag varsa kaldır, yoksa ekle
execute if entity @s[tag=click_api.debug] run tag @s remove click_api.debug
execute if entity @s[tag=!click_api.debug] run tag @s add click_api.debug

# Durum bilgisi
execute if entity @s[tag=click_api.debug] run tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"Debug mode: ","color":"white"},{"text":"ON","color":"green","bold":true}]
execute if entity @s[tag=!click_api.debug] run tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"Debug mode: ","color":"white"},{"text":"OFF","color":"red","bold":true}]
