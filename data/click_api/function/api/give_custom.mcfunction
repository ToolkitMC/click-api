# click_api v2.5 | api/give_custom
# Storage'daki ayarlarla özel click_api item ver
#
# @usage:
#   data modify storage click_api:cmd give_name set value '{"text":"İsim","italic":false}'
#   data modify storage click_api:cmd give_data set value {run:{Command:"say hi",Delay:0}}
#   function click_api:api/give_custom {value:1}
#
# give_name ve give_data opsiyonel. Verilmezse varsayılan item verilir.

$scoreboard players set @s click_api.temp $(value)

# give_name veya give_data yoksa varsayılanları doldur
execute unless data storage click_api:cmd give_name run data modify storage click_api:cmd give_name set value ""
execute unless data storage click_api:cmd give_data run data modify storage click_api:cmd give_data set value {}

execute if score @s click_api.temp matches 1 run function click_api:internal/give_custom/lc with storage click_api:cmd
execute if score @s click_api.temp matches 2 run function click_api:internal/give_custom/rc with storage click_api:cmd
execute if score @s click_api.temp matches 3 run function click_api:internal/give_custom/main with storage click_api:cmd

data remove storage click_api:cmd give_name
data remove storage click_api:cmd give_data

execute if score @s click_api.temp matches 1 run function #click_api:on_give_left
execute if score @s click_api.temp matches 2 run function #click_api:on_give_right
execute if score @s click_api.temp matches 3 run function #click_api:on_give_main

scoreboard players reset @s click_api.temp
