# click_api v2.2 | detect/right_click
# @context: @s = tıklayan oyuncu

# Sadece right_click veya main tipli item'lar geçer
execute unless data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{type:"right_click"}} unless data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{type:"main"}} run return 0

# Scoreboard sıfırla
scoreboard players reset @s click_api.rc

# Event storage'a kaydet
data modify storage click_api:event current set value {type:"right_click"}
data modify storage click_api:event current.executor_uuid set from entity @s UUID
function click_api:event/trigger with storage click_api:event current

# Tip bazlı hook tag'larını çalıştır
execute if data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{type:"right_click"}} run function #click_api:on_right_click
execute if data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{type:"main"}} run function #click_api:on_main_right
function #click_api:on_any_click

# clickAPI.run -> queue (Executor UUID ile)
execute if data entity @s SelectedItem.components."minecraft:custom_data".clickAPI.run run function click_api:cmd/queue_from_entity
