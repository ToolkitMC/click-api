# click_api v2.5 | internal/give_custom/rc
# @input: {give_name: string (JSON), give_data: compound}
$item replace entity @s weapon.mainhand with carrot_on_a_stick[minecraft:custom_data={clickAPI:{type:"right_click"}},minecraft:item_name=$(give_name)]
$item modify entity @s weapon.mainhand {function:"minecraft:set_custom_data",tag:"{clickAPI:{run:$(give_data)}}"}
