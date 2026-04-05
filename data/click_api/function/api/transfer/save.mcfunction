# click_api v2.5 | api/transfer/save
# @s'in elindeki click_api item'ını storage'a kaydet
# @context: @s = item'ı verecek oyuncu

execute unless data entity @s SelectedItem.components."minecraft:custom_data".clickAPI run return 0

data modify storage click_api:transfer item set from entity @s SelectedItem
item replace entity @s weapon.mainhand with air
