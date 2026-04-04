# click_api | api/example
# Baska bir pack bu dosyayi kendi tag'ine ekler:
#
# data/SENIN_NAMESPACE/tags/function/on_right_click_handler.json yok,
# direk click_api tag'ine eklenir:
#
# data/click_api/tags/function/on_right_click.json:
# { "values": ["senin_namespace:click/on_right_click"] }
#
# Bu fonksiyon @s = tiklayan oyuncu context'inde calisir.

# Ornek kullanim:
tellraw @s {"text":"[click_api] Sag tik algilandi!","color":"yellow"}
