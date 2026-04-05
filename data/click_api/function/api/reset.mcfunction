# click_api v2.4 | api/reset
# Storage'ı ve scoreboard'ları sıfırla, load fonksiyonunu yeniden çalıştır
# @warning: Tüm event history ve command queue silinir

data remove storage click_api:internal loaded
data remove storage click_api:event history
data modify storage click_api:cmd queue set value []
data modify storage click_api:event queue set value []

function click_api:internal/load

tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"Reset complete","color":"white"}]
