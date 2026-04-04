# click_api v2.2 | cmd/queue_add_multi_step
# Commands[0]'ı işle ve listeden çıkar

# İlk elemanı temp'e kopyala
data modify storage click_api:cmd multi_temp set from storage click_api:cmd input.Commands[0]

# delay yoksa 0 yap
execute unless data storage click_api:cmd multi_temp.delay run data modify storage click_api:cmd multi_temp.delay set value 0

# Executor UUID'sini multi_temp'e kopyala
data modify storage click_api:cmd multi_temp.executor set from storage click_api:cmd input.Executor

# Normalize et ve kuyruğa ekle
function click_api:cmd/queue_add_multi_normalize with storage click_api:cmd multi_temp

# İşleneni sil
data remove storage click_api:cmd input.Commands[0]

# Sonraki eleman varsa devam et
execute if data storage click_api:cmd input.Commands[0] run function click_api:cmd/queue_add_multi_step
