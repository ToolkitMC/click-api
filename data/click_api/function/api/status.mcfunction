# click_api v2.4 | api/status

tellraw @s ["",{"text":"========== ","color":"green","bold":true},{"text":"click_api Status","color":"white","bold":true},{"text":" ==========","color":"green","bold":true}]
tellraw @s ["",{"text":"Version: ","color":"gray"},{"nbt":"version","storage":"click_api:internal","color":"yellow"}]
tellraw @s ["",{"text":"Author: ","color":"gray"},{"nbt":"author","storage":"click_api:internal","color":"yellow"}]

execute store result score #queue_size click_api.temp run data get storage click_api:cmd queue
tellraw @s ["",{"text":"Command Queue: ","color":"gray"},{"score":{"name":"#queue_size","objective":"click_api.temp"},"color":"yellow"},{"text":" items","color":"gray"}]

execute store result score #history_size click_api.temp run data get storage click_api:event history
tellraw @s ["",{"text":"Event History: ","color":"gray"},{"score":{"name":"#history_size","objective":"click_api.temp"},"color":"yellow"},{"text":" events","color":"gray"}]

execute if score @s click_api.cooldown matches 1.. run tellraw @s ["",{"text":"Cooldown: ","color":"gray"},{"score":{"name":"@s","objective":"click_api.cooldown"},"color":"red"},{"text":" ticks remaining","color":"gray"}]
execute unless score @s click_api.cooldown matches 1.. run tellraw @s ["",{"text":"Cooldown: ","color":"gray"},{"text":"none","color":"green"}]

execute if entity @s[tag=click_api.debug] run tellraw @s ["",{"text":"Debug Mode: ","color":"gray"},{"text":"ON","color":"green","bold":true}]
execute unless entity @s[tag=click_api.debug] run tellraw @s ["",{"text":"Debug Mode: ","color":"gray"},{"text":"OFF","color":"red"}]

tellraw @s ["",{"text":"=====================================","color":"green","bold":true}]

execute if data storage click_api:transfer item run tellraw @s ["",{"text":"Transfer Slot: ","color":"gray"},{"nbt":"transfer.item.id","storage":"click_api:","color":"yellow"},{"text":" (dolu)","color":"yellow"}]
execute unless data storage click_api:transfer item run tellraw @s ["",{"text":"Transfer Slot: ","color":"gray"},{"text":"boş","color":"green"}]
