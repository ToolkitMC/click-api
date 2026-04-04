# click_api v2.1 | cmd/queue_add_multi
# Çoklu komut listesini kuyruğa ekle
# @input: storage click_api:cmd input = {Commands:[{cmd:"...",delay:0},...]}
# Her Commands[N] elemanını {Command:"...", Delay:N} formatına çevirip kuyruğa ekle

# İlk elemanı işle
execute if data storage click_api:cmd input.Commands[0] run function click_api:cmd/queue_add_multi_step

# Temizle
data remove storage click_api:cmd input.Commands
