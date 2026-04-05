# click_api v2.4 | internal/tick
# Ana tick loop

# Cooldown decrement (cooldown > 0 olan oyuncular)
scoreboard players remove @a[scores={click_api.cooldown=1..}] click_api.cooldown 1

# Right click detection
execute as @a[scores={click_api.rc=1..}] if data entity @s SelectedItem.components."minecraft:custom_data".clickAPI run function click_api:detect/right_click

# Left click detection
execute as @a[scores={click_api.lc_dealt=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] if data entity @s SelectedItem.components."minecraft:custom_data".clickAPI if data entity @s SelectedItem.components."minecraft:piercing_weapon" run function click_api:detect/left_click

# lc_dealt sıfırla
scoreboard players reset @a click_api.lc_dealt

# Command queue işleme
execute if data storage click_api:cmd queue[0] run function click_api:cmd/process_queue
