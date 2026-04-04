scoreboard players set @s click_api.temp $(value)

execute if score @s click_api.temp matches 1 run function click_api:internal/give/lc
execute if score @s click_api.temp matches 2 run function click_api:internal/give/rc

scoreboard players reset @s click_api.temp