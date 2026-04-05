# click_api v2.4 | internal/give/apply_name
# weapon.mainhand'e item_name uygula
# @pre: data modify storage click_api:cmd give_name set value '<json>'
item modify entity @s weapon.mainhand click_api:internal/apply_give_name
data remove storage click_api:cmd give_name
