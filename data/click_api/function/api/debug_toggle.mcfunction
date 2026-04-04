# click_api v2.0 | api/debug_toggle
# Debug mode toggle

# Önceki durumu kaydetmek için geçici bir tag veya skorboard kullanmak en güvenli yoldur.
# En basit ve en temiz yöntem (1.13+ çalışır):

# 1. Tag yoksa ekle, varsa kaldır (gerçek toggle)
execute if entity @s[tag=click_api.debug] run tag @s remove click_api.debug
execute if entity @s[tag=!click_api.debug] run tag @s add click_api.debug

# 2. Yeni durumu bildir
execute if entity @s[tag=click_api.debug] run tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"Debug mode: ","color":"white"},{"text":"ON","color":"green","bold":true}]
execute if entity @s[tag=!click_api.debug] run tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"Debug mode: ","color":"white"},{"text":"OFF","color":"red","bold":true}]
