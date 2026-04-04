# click_api | overlays/1_21 | detect/left_click
# 1.21.0-1.21.3: piercing_weapon component kontrolü yok

# Sadece left_click veya main tipli item'lar geçer
execute unless data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{type:"left_click"}} unless data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{type:"main"}} run return 0

# Event storage'a kaydet
data modify storage click_api:event current set value {type:"left_click"}
data modify storage click_api:event current.executor_uuid set from entity @s UUID
function click_api:event/trigger with storage click_api:event current

# Tip bazlı hook tag'larını çalıştır
execute if data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{type:"left_click"}} run function #click_api:on_left_click
execute if data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{type:"main"}} run function #click_api:on_main_left
function #click_api:on_any_click

# clickAPI.run -> queue (Executor UUID ile)
execute if data entity @s SelectedItem.components."minecraft:custom_data".clickAPI.run run function click_api:cmd/queue_from_entity
