# click_api v2.5 | api/transfer/peek
# Storage'da bekleyen transfer item'ı göster (debug)

execute if data storage click_api:transfer item run tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"Transfer item: ","color":"gray"},{"nbt":"item.id","storage":"click_api:transfer","color":"yellow"}]
execute unless data storage click_api:transfer item run tellraw @s ["",{"text":"[click_api] ","color":"green","bold":true},{"text":"No item in transfer slot","color":"gray"}]
