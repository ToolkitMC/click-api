# click_api | cmd/process_queue
# @s = player context
# Processes all commands in click_api:cmd queue storage, then clears them.

execute if data storage click_api:cmd queue[0] run function click_api:cmd/process_queue_step
