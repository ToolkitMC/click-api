# click_api | internal/on_left_click
# Left click on entity detected - @s = player who clicked

# Revoke advancement so it can trigger again
advancement revoke @s only click_api:left_click_entity

# Call hook tag (other packs attach here)
function #click_api:on_left_click
