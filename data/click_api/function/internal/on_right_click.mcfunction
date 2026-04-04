# click_api | internal/on_right_click
# Sag tik algilandi - @s = tiklayan oyuncu

# Advancement'i revoke et (tekrar tetiklenebilsin)
advancement revoke @s only click_api:right_click

# Hook fonksiyonunu cagir (diger packler buraya baglanir)
function #click_api:on_right_click
