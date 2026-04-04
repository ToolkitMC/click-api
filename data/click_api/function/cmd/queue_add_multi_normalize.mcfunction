# click_api v2.2 | cmd/queue_add_multi_normalize
# {cmd, delay, executor} -> kuyruğa {Command, Delay, Executor} olarak ekle
$data modify storage click_api:cmd queue append value {Command:"$(cmd)",Delay:$(delay),Executor:$(executor)}
