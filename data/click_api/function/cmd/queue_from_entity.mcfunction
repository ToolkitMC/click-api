# click_api v2.2 | cmd/queue_from_entity
# @context: @s = tıklayan oyuncu
# Entity'nin SelectedItem'ından run verisini okuyup kuyruğa ekle
# Executor UUID'sini de queue elemanına göm

# run verisini storage'a kopyala
data modify storage click_api:cmd input set from entity @s SelectedItem.components."minecraft:custom_data".clickAPI.run

# Executor UUID'sini ekle
data modify storage click_api:cmd input.Executor set from entity @s UUID

# Tek komut mu çoklu mu?
execute if data storage click_api:cmd input.Command run function click_api:cmd/queue_add_single
execute if data storage click_api:cmd input.Commands run function click_api:cmd/queue_add_multi

# Temizle
data remove storage click_api:cmd input
