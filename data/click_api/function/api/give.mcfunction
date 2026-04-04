# click_api v2.2 | api/give
# Hazır click_api item ver ve ilgili give hook tag'ını çalıştır
# @usage: function click_api:api/give {value:1}
# @values:
#   1 = left_click  item -> item ver, #click_api:on_give_left  çalışır
#   2 = right_click item -> item ver, #click_api:on_give_right çalışır
#   3 = main        item -> item ver, #click_api:on_give_main  çalışır

$scoreboard players set @s click_api.temp $(value)

execute if score @s click_api.temp matches 1 run function click_api:internal/give/lc
execute if score @s click_api.temp matches 2 run function click_api:internal/give/rc
execute if score @s click_api.temp matches 3 run function click_api:internal/give/main

execute if score @s click_api.temp matches 1 run function #click_api:on_give_left
execute if score @s click_api.temp matches 2 run function #click_api:on_give_right
execute if score @s click_api.temp matches 3 run function #click_api:on_give_main

scoreboard players reset @s click_api.temp
