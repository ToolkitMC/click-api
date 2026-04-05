# click_api v2.5 | internal/give_custom/lc
# @input: {give_name: string (JSON), give_data: compound}
$item replace entity @s weapon.mainhand with carrot_on_a_stick[minecraft:custom_data={clickAPI:{type:"left_click",$(give_data)}},minecraft:piercing_weapon={},minecraft:item_name=$(give_name)]
enchant @s click_api:lc
