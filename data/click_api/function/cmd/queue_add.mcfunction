# click_api v2.1 | cmd/queue_add
# Kuyruğa komut(lar) ekle
# @usage - Tek komut:
#   function click_api:cmd/queue_add with entity @s SelectedItem.components."minecraft:custom_data".clickAPI.run
#   NBT: {Command:"say Hello", Delay:0}
# @usage - Çoklu komut:
#   NBT: {Commands:[{cmd:"say Hello",delay:0},{cmd:"say World",delay:10}]}
#
# Bu fonksiyon macro DEĞİL - storage üzerinden okur.
# Çağırmadan önce storage'a yaz:
#   data modify storage click_api:cmd input set from entity @s SelectedItem.components."minecraft:custom_data".clickAPI.run
#   function click_api:cmd/queue_add

# Tek Command formatı kontrolü
execute if data storage click_api:cmd input.Command run function click_api:cmd/queue_add_single

# Çoklu Commands formatı kontrolü
execute if data storage click_api:cmd input.Commands run function click_api:cmd/queue_add_multi
