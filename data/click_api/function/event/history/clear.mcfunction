# click_api v2.5 | event/history/clear
# Event geçmişini temizle

data modify storage click_api:event history set value []
tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"Event history cleared","color":"gray"}]
