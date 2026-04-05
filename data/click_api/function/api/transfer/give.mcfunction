# click_api v2.5.3 | api/transfer/give
# Storage'daki item'ı @s'e ver
# @context: @s = item'ı alacak oyuncu
# Not: 'item replace ... from storage' desteklenmiyor.
# Çözüm: id+count macro ile slot'a yaz, sonra components'ı copy_custom_data ile kopyala.

execute unless data storage click_api:transfer item run return 0

function click_api:internal/transfer/give_macro with storage click_api:transfer item
item modify entity @s weapon.mainhand {function:"minecraft:copy_custom_data",source:{type:"storage",source:"click_api:transfer"},ops:[{source:"item.components",target:"",op:"merge"}]}
data remove storage click_api:transfer item
