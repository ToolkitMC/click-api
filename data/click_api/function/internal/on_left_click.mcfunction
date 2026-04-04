# click_api | internal/on_left_click
# Sol tik entity algilandi - @s = tiklayan oyuncu

# Advancement'i revoke et (tekrar tetiklenebilsin)
advancement revoke @s only click_api:left_click_entity

# Hook fonksiyonunu cagir
function #click_api:on_left_click
