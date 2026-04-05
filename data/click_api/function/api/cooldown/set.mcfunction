# click_api v2.4 | api/cooldown/set
# @s'e tıklama cooldown'u uygula
# @usage: function click_api:api/cooldown/set {ticks:20}
# @context: @s = cooldown uygulanacak oyuncu
# Cooldown süresince detect fonksiyonları return 0 ile erken çıkar

$scoreboard players set @s click_api.cooldown $(ticks)
