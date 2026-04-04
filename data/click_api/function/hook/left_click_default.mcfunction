# click_api v2.0 | hook/left_click_default
# Default left click handler - boş kalabilir veya debug mesajı gösterebilir
# @context: @s = tıklayan oyuncu

# Debug mode aktifse bildirim göster
execute if entity @s[tag=click_api.debug] run tellraw @s ["",{"text":"[DEBUG] ","color":"gray"},{"text":"Left Click","color":"yellow"}]
