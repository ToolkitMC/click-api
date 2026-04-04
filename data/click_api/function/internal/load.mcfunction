# click_api | ToolkitMC
# github.com/ToolkitMC/click-api
# MIT License
# Load - scoreboard ve storage init

# Sağ tık: using_item advancement ile tespit edilir (advancement/right_click.json)
# Sol tık entity: player_hurt_entity advancement (advancement/left_click_entity.json)
# Sol tık blok/air: tick'te minecraft.mined stat delta takibi
scoreboard objectives add click_api.mined dummy

# Delta prev değerleri
scoreboard objectives add click_api.rc.prev dummy

# Yüklendi bayrağı
data modify storage click_api:data loaded set value 1b

tellraw @a[tag=click_api.debug] {"text":"[click_api] v1.0.0 Loaded","color":"green","bold":true}
