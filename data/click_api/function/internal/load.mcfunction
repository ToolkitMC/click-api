# click_api v2.0 | ToolkitMC
# @author: tickwarden, asn44nb
# Scoreboard/Macro tabanlı click detection sistemi

execute if data storage click_api:internal {loaded:1b} run return 0

# Scoreboard'ları oluştur
scoreboard objectives add click_api.rc minecraft.used:minecraft.carrot_on_a_stick "Right Click"

# Storage init
execute unless data storage click_api:event queue run data modify storage click_api:event queue set value []
execute unless data storage click_api:cmd queue run data modify storage click_api:cmd queue set value []

# Versiyon bilgisi
data modify storage click_api:internal version set value "1.0.1"
data modify storage click_api:internal author set value "ToolkitMC"

# Loaded olarak işaretle
data modify storage click_api:internal loaded set value 1b

# Debug mesajı
tellraw @a[tag=click_api.debug] [{"text":"[click_api] ","color":"green","bold":true},{"text":"v1.0.1 Loaded","color":"white","bold":false}]
