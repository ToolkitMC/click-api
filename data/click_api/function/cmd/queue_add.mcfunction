# click_api v2.0 | cmd/queue_add
# Kuyruğa komut ekle
# @usage: function click_api:cmd/queue_add {Command:"say Hello",Delay:20}
# @input: {Command: string, Delay?: int}

$data modify storage click_api:cmd queue append value {Command:"$(Command)",Delay:$(Delay)}
