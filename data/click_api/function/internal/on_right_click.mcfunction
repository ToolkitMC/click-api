# click_api | internal/on_right_click
# Right click detected - @s = player who clicked

# Revoke advancement so it can trigger again
advancement revoke @s only click_api:right_click

# Process command queue
function click_api:cmd/process_queue

# Call hook tag (other packs attach here)
function #click_api:on_right_click
