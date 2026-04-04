# click_api | api/example
# This file is for reference only, feel free to delete it.
#
# == HOOK USAGE ==
# Add your function to the click_api tag files:
#   data/click_api/tags/function/on_right_click.json
#   { "values": ["your_namespace:your_function"] }
# Your function runs with @s = the player who clicked.
#
# == DIRECT COMMAND ==
# Run a command instantly from anywhere:
#   function click_api:cmd/run {Command:"gamemode creative @s"}
#
# == QUEUE SYSTEM ==
# Queue commands to run on the next right click:
#   data modify storage click_api:cmd queue append value {Command:"say Hello"}
#   data modify storage click_api:cmd queue append value {Command:"gamemode creative @s"}
#
# Queue is processed and cleared automatically on right click.
# @s = the player who clicked.
#
# == UNINSTALL ==
#   /function click_api:uninstall
