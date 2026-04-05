# click_api v2.4 | api/queue_clear
# Tüm bekleyen komut kuyruğunu temizle
# @context: herhangi bir entity (genellikle @s veya sunucu)

data modify storage click_api:cmd queue set value []
tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"Command queue cleared","color":"gray"}]
