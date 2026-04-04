# click_api v2.1.1 | internal/tick
# Ana tick loop - click detection
# Her tip (left_click, right_click, main) buradan geçer, çakışma olmaz.

# Right click: rc scoreboard >= 1 olan HERKESİ yakala (tip fark etmez)
execute as @a[scores={click_api.rc=1..}] if data entity @s SelectedItem.components."minecraft:custom_data".clickAPI run function click_api:detect/right_click

# Left click: lc_dealt >= 1 olan HERKESİ yakala (tip fark etmez)
execute as @a[scores={click_api.lc_dealt=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] if data entity @s SelectedItem.components."minecraft:custom_data".clickAPI if data entity @s SelectedItem.components."minecraft:piercing_weapon" run function click_api:detect/left_click

# lc_dealt sıfırla
scoreboard players reset @a click_api.lc_dealt

# Command queue işleme
execute if data storage click_api:cmd queue[0] run function click_api:cmd/process_queue
