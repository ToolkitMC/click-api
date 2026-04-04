# click_api v2.0 | api/show_events
# Son event'leri göster
# @context: @s = event'leri görmek isteyen oyuncu

tellraw @s ["",{"text":"========== ","color":"yellow","bold":true},{"text":"Event History","color":"white","bold":true},{"text":" ==========","color":"yellow","bold":true}]

# Son 10 event'i göster
execute if data storage click_api:event history[0] run tellraw @s ["",{"text":"[0] ","color":"gray"},{"nbt":"history[0].type","storage":"click_api:event","color":"yellow"}]
execute if data storage click_api:event history[1] run tellraw @s ["",{"text":"[1] ","color":"gray"},{"nbt":"history[1].type","storage":"click_api:event","color":"yellow"}]
execute if data storage click_api:event history[2] run tellraw @s ["",{"text":"[2] ","color":"gray"},{"nbt":"history[2].type","storage":"click_api:event","color":"yellow"}]
execute if data storage click_api:event history[3] run tellraw @s ["",{"text":"[3] ","color":"gray"},{"nbt":"history[3].type","storage":"click_api:event","color":"yellow"}]
execute if data storage click_api:event history[4] run tellraw @s ["",{"text":"[4] ","color":"gray"},{"nbt":"history[4].type","storage":"click_api:event","color":"yellow"}]
execute if data storage click_api:event history[5] run tellraw @s ["",{"text":"[5] ","color":"gray"},{"nbt":"history[5].type","storage":"click_api:event","color":"yellow"}]
execute if data storage click_api:event history[6] run tellraw @s ["",{"text":"[6] ","color":"gray"},{"nbt":"history[6].type","storage":"click_api:event","color":"yellow"}]
execute if data storage click_api:event history[7] run tellraw @s ["",{"text":"[7] ","color":"gray"},{"nbt":"history[7].type","storage":"click_api:event","color":"yellow"}]
execute if data storage click_api:event history[8] run tellraw @s ["",{"text":"[8] ","color":"gray"},{"nbt":"history[8].type","storage":"click_api:event","color":"yellow"}]
execute if data storage click_api:event history[9] run tellraw @s ["",{"text":"[9] ","color":"gray"},{"nbt":"history[9].type","storage":"click_api:event","color":"yellow"}]

execute unless data storage click_api:event history[0] run tellraw @s ["",{"text":"No events recorded yet","color":"gray","italic":true}]

tellraw @s ["",{"text":"=====================================","color":"yellow","bold":true}]
