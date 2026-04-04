# click_api | internal/uninstall

advancement revoke @a only click_api:right_click
advancement revoke @a only click_api:left_click_entity

data merge storage click_api:data {}
data merge storage click_api:cmd {}

tellraw @a {"text":"[click_api] Uninstalled. Please remove the datapack.","color":"red","bold":true}
