# click_api | ToolkitMC
# github.com/ToolkitMC/click-api
# MIT License
# internal/load

# Mark as loaded
data modify storage click_api:data loaded set value 1b

# Init queue only if not already present (survives /reload)
execute unless data storage click_api:cmd queue run data modify storage click_api:cmd queue set value []

tellraw @a[tag=click_api.debug] {"text":"[click_api] v1.0.0 Loaded","color":"green","bold":true}
