# click_api v2.1 | ToolkitMC
# @author: tickwarden, asn44nb
# Scoreboard/Macro tabanlı click detection sistemi

execute if data storage click_api:internal {loaded:1b} run return 0

# Scoreboard'ları oluştur
scoreboard objectives add click_api.temp dummy
scoreboard objectives add click_api.debug dummy
scoreboard objectives add click_api.rc minecraft.used:minecraft.carrot_on_a_stick "Right Click"
scoreboard objectives add click_api.lc_dealt minecraft.custom:minecraft.damage_dealt_absorbed

# Storage init
execute unless data storage click_api:event queue run data modify storage click_api:event queue set value []
execute unless data storage click_api:cmd queue run data modify storage click_api:cmd queue set value []

# Versiyon bilgisi
data modify storage click_api:internal version set value "2.1.0"
data modify storage click_api:internal author set value "ToolkitMC"

# Loaded olarak işaretle
data modify storage click_api:internal loaded set value 1b

# Debug mesajı
tellraw @a[tag=click_api.debug] [{"text":"[click_api] ","color":"green","bold":true},{"text":"v2.1.0 Loaded","color":"white","bold":false}]
