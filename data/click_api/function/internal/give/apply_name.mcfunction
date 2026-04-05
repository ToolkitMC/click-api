# click_api v2.5.3 | internal/give/apply_name
# weapon.mainhand'e item_name uygula
# @pre: data modify storage click_api:cmd give_name set value '<json>'
function click_api:internal/give/apply_name_macro with storage click_api:cmd
data remove storage click_api:cmd give_name
