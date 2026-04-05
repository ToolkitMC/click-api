# click_api v2.4 | api/cooldown/check
# @s cooldownda mı kontrol et, debug modunda bildir
execute if score @s click_api.cooldown matches 1.. run tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"Cooldown: ","color":"gray"},{"score":{"name":"@s","objective":"click_api.cooldown"},"color":"yellow"},{"text":" ticks","color":"gray"}]
execute unless score @s click_api.cooldown matches 1.. run tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"No cooldown active","color":"gray"}]
