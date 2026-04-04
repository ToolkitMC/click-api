# click_api v2.0 | cmd/delay_decrement
# Delay'i 1 azalt

# Delay'i azalt
scoreboard players remove #delay click_api.rc 1

# Storage'a geri yaz
execute store result storage click_api:cmd queue[0].Delay int 1 run scoreboard players get #delay click_api.rc
