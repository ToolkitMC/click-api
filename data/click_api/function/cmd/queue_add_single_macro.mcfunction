# click_api v2.2 | cmd/queue_add_single_macro
# @input: {Command: string, Delay: int, Executor: int[]}
$data modify storage click_api:cmd queue append value {Command:"$(Command)",Delay:$(Delay),Executor:$(Executor)}
