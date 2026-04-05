# click_api v2.4 | internal/give/apply_data_macro
# @input: {give_data: compound}
$data merge entity @s {SelectedItem:{components:{"minecraft:custom_data":{clickAPI:$(give_data)}}}}
data remove storage click_api:cmd give_data
