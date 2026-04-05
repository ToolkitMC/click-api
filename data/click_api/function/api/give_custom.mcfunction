# click_api v2.4 | api/give_custom
# Storage'daki ayarlarla özel click_api item ver
#
# @usage:
#   # 1. İsteğe bağlı ayarları storage'a yaz
#   data modify storage click_api:cmd give_name set value '{"text":"İsim","italic":false}'
#   data modify storage click_api:cmd give_data set value {run:{Command:"say hi",Delay:0}}
#   # 2. Fonksiyonu çağır
#   function click_api:api/give_custom {value:1}
#
# give_name: item_name component (JSON text, opsiyonel)
# give_data: clickAPI compound'una merge edilecek ek NBT (opsiyonel)

$scoreboard players set @s click_api.temp $(value)

execute if score @s click_api.temp matches 1 run function click_api:internal/give/lc
execute if score @s click_api.temp matches 2 run function click_api:internal/give/rc
execute if score @s click_api.temp matches 3 run function click_api:internal/give/main

# give_data varsa clickAPI'ye merge et
execute if data storage click_api:cmd give_data run function click_api:internal/give/apply_data

# give_name varsa item_name uygula
execute if data storage click_api:cmd give_name run function click_api:internal/give/apply_name

execute if score @s click_api.temp matches 1 run function #click_api:on_give_left
execute if score @s click_api.temp matches 2 run function #click_api:on_give_right
execute if score @s click_api.temp matches 3 run function #click_api:on_give_main

scoreboard players reset @s click_api.temp
