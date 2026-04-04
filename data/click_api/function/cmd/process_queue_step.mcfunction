# click_api | cmd/process_queue_step
# @s = player context
# Takes first item from queue, runs it, removes it, continues if more remain.

data modify storage click_api:cmd current set from storage click_api:cmd queue[0]
data remove storage click_api:cmd queue[0]
function click_api:cmd/queue_run with storage click_api:cmd current
execute if data storage click_api:cmd queue[0] run function click_api:cmd/process_queue_step
