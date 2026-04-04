# click_api | internal/tick
# Sol tık blok/air tespiti: minecraft.mined stat delta takibi
# Sağ tık ve sol tık entity advancement ile zaten yakalanır

# Her oyuncu için elinde carrot_on_a_stick varsa kontrol et
execute as @a[nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick"}}] run function click_api:internal/tick_player
