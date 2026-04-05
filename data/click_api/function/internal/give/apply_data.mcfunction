# click_api v2.4.1 | internal/give/apply_data
# weapon.mainhand'deki clickAPI'ye give_data'yı merge et
# @pre: data modify storage click_api:cmd give_data set value {...}
# @context: @s = oyuncu

item modify entity @s weapon.mainhand click_api:internal/apply_give_data
data remove storage click_api:cmd give_data
