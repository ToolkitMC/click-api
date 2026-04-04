# click_api | cmd/run
# Direct macro command runner.
# Usage:
#   function click_api:cmd/run {Command:"say Hello"}
#   function click_api:cmd/run {Command:"gamemode creative @s"}
#
# No leading / needed. @s and at @s context is valid.

$execute at @s run $(Command)
