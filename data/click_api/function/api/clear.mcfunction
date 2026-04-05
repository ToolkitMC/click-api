# click_api v2.4 | api/clear
# Oyuncunun elindeki click_api item'ını kaldır
# @context: @s = temizlenecek oyuncu
# Sadece weapon.mainhand'de clickAPI custom_data'sı olan item'ı kaldırır

execute if data entity @s SelectedItem.components."minecraft:custom_data".clickAPI run item replace entity @s weapon.mainhand with air
