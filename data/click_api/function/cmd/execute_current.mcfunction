# click_api v2.0 | cmd/execute_current
# Mevcut komutu çalıştır ve kuyruktan kaldır

# Komutu çalıştır
function click_api:cmd/run_from_storage with storage click_api:cmd current

# Kuyruktan kaldır
data remove storage click_api:cmd queue[0]

# Recursive call - sonraki elemanı işle
execute if data storage click_api:cmd queue[0] run function click_api:cmd/process_queue_step
