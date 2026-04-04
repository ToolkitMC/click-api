# click_api v2.2 | cmd/process_queue_step
# Kuyruk elemanını işle

# İlk elemanı kopyala
data modify storage click_api:cmd current set from storage click_api:cmd queue[0]

# Delay kontrolü (click_api.temp kullan)
execute store result score #delay click_api.temp run data get storage click_api:cmd current.Delay

# Delay varsa azalt, yoksa çalıştır
execute if score #delay click_api.temp matches 1.. run function click_api:cmd/delay_decrement
execute if score #delay click_api.temp matches 0 run function click_api:cmd/execute_current
