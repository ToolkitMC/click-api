# click_api v2.2 | cmd/queue_add_single
# @input storage click_api:cmd input = {Command:"...", Delay:0, Executor:[I;x,x,x,x]}

# Delay yoksa 0 yap
execute unless data storage click_api:cmd input.Delay run data modify storage click_api:cmd input.Delay set value 0

# Macro ile kuyruğa ekle
function click_api:cmd/queue_add_single_macro with storage click_api:cmd input
