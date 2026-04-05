# click_api v2.4 | internal/give/apply_data_macro
# @input: {give_data: compound}
$item modify entity @s weapon.mainhand {function:"minecraft:set_custom_data",tag:"{clickAPI:$(give_data)}"}
data remove storage click_api:cmd give_data