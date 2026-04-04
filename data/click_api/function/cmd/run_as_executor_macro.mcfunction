# click_api v2.2 | cmd/run_as_executor_macro
# @input: {Command: string, Executor: int[]}
$execute as @a[nbt={UUID:$(Executor)}] at @s run $(Command)
