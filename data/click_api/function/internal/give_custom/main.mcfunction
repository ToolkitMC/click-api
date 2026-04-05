# click_api v2.5.3 | internal/give_custom/main
# @input: {give_name: string (JSON text component), give_data: compound}
$item replace entity @s weapon.mainhand with carrot_on_a_stick[minecraft:custom_data={clickAPI:{type:"main"}},minecraft:piercing_weapon={},minecraft:item_name=$(give_name)]
item modify entity @s weapon.mainhand {function:"minecraft:copy_custom_data",source:{type:"storage",source:"click_api:cmd"},ops:[{source:"give_data",target:"clickAPI.run",op:"replace"}]}
enchant @s click_api:lc
