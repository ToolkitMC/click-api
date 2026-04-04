# click_api v2.0 | event/trigger
# @context: @s = event tetikleyen oyuncu
# @input: storage click_api:event current {type, player_id}
# Macro-based event dispatcher

# Event history'ye kaydet (son 10 event)
data modify storage click_api:event history prepend from storage click_api:event current
execute if data storage click_api:event history[10] run data remove storage click_api:event history[10]

# Debug output
execute if entity @s[tag=click_api.debug] run tellraw @s ["",{"text":"[DEBUG] Event: ","color":"gray"},{"nbt":"current.type","storage":"click_api:event","color":"yellow"}]
