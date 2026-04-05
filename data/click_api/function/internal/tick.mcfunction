# click_api v2.4.1 | internal/tick
# Ana tick loop

# Cooldown decrement
scoreboard players remove @a[scores={click_api.cooldown=1..}] click_api.cooldown 1

# Right click detection (scoreboard tabanlı)
execute as @a[scores={click_api.rc=1..}] if data entity @s SelectedItem.components."minecraft:custom_data".clickAPI run function click_api:detect/right_click

# Left click: enchantment efekti (post_piercing_attack) direkt detect/left_click'i çağırır
# Tick'te ayrıca kontrol gerekmez

# Command queue işleme
execute if data storage click_api:cmd queue[0] run function click_api:cmd/process_queue