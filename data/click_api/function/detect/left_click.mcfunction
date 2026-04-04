# click_api v2.0 | detect/left_click
# @context: @s = tıklayan oyuncu
# @input: scores.click_api.lc_dealt >= 1, SelectedItem = carrot_on_a_stick

# Event storage'a kaydet
data modify storage click_api:event current set value {type:"left_click"}
execute store result storage click_api:event current.player_id int 1 run scoreboard players get @s click_api.lc_dealt
function click_api:event/trigger with storage click_api:event current

# Hook tag'ini çalıştır
function #click_api:on_left_click
function click_api:cmd/queue_add with entity @s SelectedItem.components."minecraft:custom_data".clickAPI.run