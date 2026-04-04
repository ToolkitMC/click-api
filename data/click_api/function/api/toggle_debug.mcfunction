execute if entity @s[tag=!click_api.debug] run tag @s add click_api.debug
execute if entity @s[tag=click_api.debug] run tag @s remove click_api.debug

execute if entity @s[tag=!click_api.debug] run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
execute if entity @s[tag=click_api.debug] run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1
