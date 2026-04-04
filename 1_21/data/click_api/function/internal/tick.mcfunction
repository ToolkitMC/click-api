# click_api | overlays/1_21 | internal/tick
# 1.21.0-1.21.3: piercing_weapon component yok, left click sadece enchantment efektiyle tetiklenir

# Right click detection
execute as @a[scores={click_api.rc=1..}] if data entity @s SelectedItem.components."minecraft:custom_data".clickAPI run function click_api:detect/right_click

# Left click detection - piercing_weapon kontrolü YOK (component 1.21.4'te eklendi)
execute as @a[scores={click_api.lc_dealt=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] if data entity @s SelectedItem.components."minecraft:custom_data".clickAPI run function click_api:detect/left_click

# lc_dealt sıfırla
scoreboard players reset @a click_api.lc_dealt

# Command queue işleme
execute if data storage click_api:cmd queue[0] run function click_api:cmd/process_queue
