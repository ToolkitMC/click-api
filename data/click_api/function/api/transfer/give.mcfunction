# click_api v2.5.3 | api/transfer/give
# Storage'daki item'ı @s'e ver
# @context: @s = item'ı alacak oyuncu

execute unless data storage click_api:transfer item run return 0

item replace entity @s weapon.mainhand from storage click_api:transfer item
data remove storage click_api:transfer item
