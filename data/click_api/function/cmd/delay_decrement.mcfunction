# click_api v2.2 | cmd/delay_decrement
# Delay'i 1 azalt (click_api.temp kullan)
scoreboard players remove #delay click_api.temp 1
execute store result storage click_api:cmd queue[0].Delay int 1 run scoreboard players get #delay click_api.temp
