# click_api v2.2 | cmd/execute_current
# Mevcut komutu oyuncu context'inde çalıştır ve kuyruktan kaldır

# Executor UUID'si varsa o oyuncu olarak çalıştır, yoksa sunucu olarak
execute if data storage click_api:cmd current.Executor run function click_api:cmd/run_as_executor
execute unless data storage click_api:cmd current.Executor run function click_api:cmd/run_from_storage with storage click_api:cmd current

# Kuyruktan kaldır
data remove storage click_api:cmd queue[0]

# Recursive - sonraki eleman
execute if data storage click_api:cmd queue[0] run function click_api:cmd/process_queue_step
