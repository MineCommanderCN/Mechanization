
#set upgrade tags
execute store result score temp_0 mech_data run data get entity @s SelectedItemSlot

execute unless score temp_0 mech_data = @s mech_itemslot run function mechanization:gadgets/upgrades/remove_upgrades_tools
execute unless score temp_0 mech_data = @s mech_itemslot if predicate mechanization:holding_weapon run function mechanization:gadgets/upgrades/tools/set_upgrades_sword
execute unless score temp_0 mech_data = @s mech_itemslot if predicate mechanization:holding_tool run function mechanization:gadgets/upgrades/tools/set_upgrades_tools

scoreboard players operation @s mech_itemslot = temp_0 mech_data

tag @s add mech_upgrade_tool

#scoreboard merging
scoreboard players set temp_4 mech_data 0
scoreboard players operation temp_4 mech_data += @s mech_usepick
scoreboard players operation temp_4 mech_data += @s mech_useaxe
scoreboard players operation temp_4 mech_data += @s mech_useshovel
scoreboard players operation temp_4 mech_data += @s mech_usenpick
scoreboard players operation temp_4 mech_data += @s mech_usenaxe
scoreboard players operation temp_4 mech_data += @s mech_usenshovel

scoreboard players set temp_5 mech_data 0
scoreboard players operation temp_5 mech_data += @s mech_usesword
scoreboard players operation temp_5 mech_data += @s mech_usensword
scoreboard players operation temp_5 mech_data += @s mech_useaxe
scoreboard players operation temp_5 mech_data += @s mech_usenaxe
scoreboard players operation temp_5 mech_data += @s mech_usetrident

#run upgrades
execute if score $base.timer_20 du_data matches 10 if entity @s[tag=mech_upgrade_empower_1] run function mechanization:gadgets/upgrades/tools/empowered_1
execute if score $base.timer_20 du_data matches 10 if entity @s[tag=mech_upgrade_empower_2] run function mechanization:gadgets/upgrades/tools/empowered_2
execute if score temp_4 mech_data matches 1.. if entity @s[tag=mech_upgrade_magnetic] run function mechanization:gadgets/upgrades/tools/magnetic
execute if score temp_4 mech_data matches 1.. unless predicate du:entity/is_sneaking if entity @s[tag=mech_upgrade_smash] as @e[type=item,sort=nearest,limit=1,distance=..8,nbt={Age:0s}] at @s run function mechanization:gadgets/upgrades/tools/smash


execute if score temp_5 mech_data matches 1.. if entity @s[tag=mech_upgrade_poison] run effect give @e[distance=0.5..8,nbt={HurtTime:10s}] poison 4 1
execute if score temp_5 mech_data matches 1.. if entity @s[tag=mech_upgrade_wither] run effect give @e[distance=0.5..8,nbt={HurtTime:10s}] wither 4 1
execute if score temp_5 mech_data matches 1.. if entity @s[tag=mech_upgrade_slowness] run effect give @e[distance=0.5..8,nbt={HurtTime:10s}] slowness 4 0
execute if score temp_5 mech_data matches 1.. if entity @s[tag=mech_upgrade_weakness] run effect give @e[distance=0.5..8,nbt={HurtTime:10s}] weakness 4 0
execute if score temp_5 mech_data matches 1.. if entity @s[tag=mech_upgrade_glow] run effect give @e[distance=0.5..8,nbt={HurtTime:10s}] glowing 4 0
execute if score temp_5 mech_data matches 1.. if entity @s[tag=mech_upgrade_vampiric] if entity @e[distance=0.5..8,nbt={HurtTime:10s}] run effect give @s regeneration 4 1

#cleanup
scoreboard players set @s mech_usetrident 0

scoreboard players set @s mech_usesword 0
scoreboard players set @s mech_usepick 0
scoreboard players set @s mech_useaxe 0
scoreboard players set @s mech_useshovel 0

scoreboard players set @s mech_usensword 0
scoreboard players set @s mech_usenpick 0
scoreboard players set @s mech_usenaxe 0
scoreboard players set @s mech_usenshovel 0
