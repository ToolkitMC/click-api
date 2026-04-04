# click_api v2.0 | detect/right_click
# @context: @s = tıklayan oyuncu
# @input: scores.click_api.rc >= 1

# Scoreboard sıfırla
scoreboard players reset @s click_api.rc

# Event storage'a kaydet
data modify storage click_api:event current set value {type:"right_click"}
execute store result storage click_api:event current.player_id int 1 run scoreboard players get @s click_api.lc_dealt
function click_api:event/trigger with storage click_api:event current

# Hook tag'ini çalıştır
function #click_api:on_right_click
function click_api:cmd/queue_add with entity @s SelectedItem.components."minecraft:custom_data".clickAPI.run