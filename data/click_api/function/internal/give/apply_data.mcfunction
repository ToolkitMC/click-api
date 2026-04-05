# click_api v2.5.3 | internal/give/apply_data
# weapon.mainhand'deki clickAPI.run'a give_data'yı kopyala
# @pre: data modify storage click_api:cmd give_data set value {...}
# @context: @s = oyuncu
item modify entity @s weapon.mainhand {function:"minecraft:copy_custom_data",source:{type:"storage",source:"click_api:cmd"},ops:[{source:"give_data",target:"clickAPI.run",op:"replace"}]}
data remove storage click_api:cmd give_data
