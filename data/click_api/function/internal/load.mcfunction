# click_api v2.5.0 | ToolkitMC
# @author: tickwarden, asn44nb

execute if data storage click_api:internal {loaded:1b} run return 0

# Scoreboard'ları oluştur
scoreboard objectives add click_api.temp dummy
scoreboard objectives add click_api.debug dummy
scoreboard objectives add click_api.cooldown dummy "Click Cooldown"
scoreboard objectives add click_api.rc minecraft.used:minecraft.carrot_on_a_stick "Right Click"

# Storage init
execute unless data storage click_api:event queue run data modify storage click_api:event queue set value []
execute unless data storage click_api:cmd queue run data modify storage click_api:cmd queue set value []

# Versiyon bilgisi
data modify storage click_api:internal version set value "2.5.1"
data modify storage click_api:internal author set value "ToolkitMC"

data modify storage click_api:internal loaded set value 1b

tellraw @a[tag=click_api.debug] [{"text":"[click_api] ","color":"green","bold":true},{"text":"v2.5.1 Loaded","color":"white"}]
