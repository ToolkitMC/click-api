# Right click detection (carrot_on_a_stick kullanımı)
execute as @a[scores={click_api.rc=1..}] if data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{type:"main"}} run function click_api:detect/right_click

# Left click detection (damage dealt tracking)
execute as @a[scores={click_api.lc_dealt=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] if data entity @s SelectedItem.components."minecraft:custom_data"{clickAPI:{type:"main"}} if data entity @s SelectedItem.components."minecraft:piercing_weapo" run function click_api:detect/left_click