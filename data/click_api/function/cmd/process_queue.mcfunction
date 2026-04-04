# click_api v2.0 | cmd/process_queue
# Komut kuyruğunu işle
# @context: server tick

# İlk elemanı al ve işle
execute if data storage click_api:cmd queue[0] run function click_api:cmd/process_queue_step
