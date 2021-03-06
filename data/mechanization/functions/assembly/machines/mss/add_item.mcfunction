
scoreboard players set temp_0 mech_data -1

execute unless data storage mechanization:networks mss.drive[{Slot:25b}] run scoreboard players set temp_0 mech_data 25
execute unless data storage mechanization:networks mss.drive[{Slot:24b}] run scoreboard players set temp_0 mech_data 24
execute unless data storage mechanization:networks mss.drive[{Slot:23b}] run scoreboard players set temp_0 mech_data 23
execute unless data storage mechanization:networks mss.drive[{Slot:22b}] run scoreboard players set temp_0 mech_data 22
execute unless data storage mechanization:networks mss.drive[{Slot:21b}] run scoreboard players set temp_0 mech_data 21
execute unless data storage mechanization:networks mss.drive[{Slot:20b}] run scoreboard players set temp_0 mech_data 20
execute unless data storage mechanization:networks mss.drive[{Slot:19b}] run scoreboard players set temp_0 mech_data 19
execute unless data storage mechanization:networks mss.drive[{Slot:18b}] run scoreboard players set temp_0 mech_data 18

execute unless data storage mechanization:networks mss.drive[{Slot:16b}] run scoreboard players set temp_0 mech_data 16
execute unless data storage mechanization:networks mss.drive[{Slot:15b}] run scoreboard players set temp_0 mech_data 15
execute unless data storage mechanization:networks mss.drive[{Slot:14b}] run scoreboard players set temp_0 mech_data 14
execute unless data storage mechanization:networks mss.drive[{Slot:13b}] run scoreboard players set temp_0 mech_data 13
execute unless data storage mechanization:networks mss.drive[{Slot:12b}] run scoreboard players set temp_0 mech_data 12
execute unless data storage mechanization:networks mss.drive[{Slot:11b}] run scoreboard players set temp_0 mech_data 11
execute unless data storage mechanization:networks mss.drive[{Slot:10b}] run scoreboard players set temp_0 mech_data 10
execute unless data storage mechanization:networks mss.drive[{Slot:9b}] run scoreboard players set temp_0 mech_data 9

execute unless data storage mechanization:networks mss.drive[{Slot:7b}] run scoreboard players set temp_0 mech_data 7
execute unless data storage mechanization:networks mss.drive[{Slot:6b}] run scoreboard players set temp_0 mech_data 6
execute unless data storage mechanization:networks mss.drive[{Slot:5b}] run scoreboard players set temp_0 mech_data 5
execute unless data storage mechanization:networks mss.drive[{Slot:4b}] run scoreboard players set temp_0 mech_data 4
execute unless data storage mechanization:networks mss.drive[{Slot:3b}] run scoreboard players set temp_0 mech_data 3
execute unless data storage mechanization:networks mss.drive[{Slot:2b}] run scoreboard players set temp_0 mech_data 2
execute unless data storage mechanization:networks mss.drive[{Slot:1b}] run scoreboard players set temp_0 mech_data 1
execute unless data storage mechanization:networks mss.drive[{Slot:0b}] run scoreboard players set temp_0 mech_data 0

#configure item data
execute store success score temp_2 mech_data if data storage mechanization:networks mss.item.tag
data modify storage mechanization:networks mss.item.tag.mss merge value {count:1,display:0b,slot:0b}

execute store result storage mechanization:networks mss.item.Slot byte 1 run scoreboard players get temp_0 mech_data
execute store result storage mechanization:networks mss.item.tag.mss.slot byte 1 run scoreboard players get temp_0 mech_data

execute store result score temp_1 mech_data run data get storage mechanization:networks mss.item.Count
execute store result storage mechanization:networks mss.item.tag.mss.count int 1 run scoreboard players get temp_1 mech_data

execute if score temp_2 mech_data matches 1 run data modify storage mechanization:networks mss.item.tag.mss.display set value 1b
execute if data storage mechanization:networks mss.item.tag.display run data modify storage mechanization:networks mss.item.tag.mss.display set value 2b
execute if data storage mechanization:networks mss.item.tag.display.Lore run data modify storage mechanization:networks mss.item.tag.mss.display set value 3b

data merge block -29999999 0 1602 {Text1:'[{"translate":"mech.mss.item_count","color":"gray","italic":false,"with":[{"score":{"name":"temp_1","objective":"mech_data"}}]}]'}
execute unless data storage mechanization:networks mss.item.tag.display.Lore run data modify storage mechanization:networks mss.item.tag.display.Lore set value []
data modify storage mechanization:networks mss.item.tag.display.Lore prepend from block -29999999 0 1602 Text1

#insert
data modify storage mechanization:networks mss.drive append from storage mechanization:networks mss.item
scoreboard players set out_0 mech_data 1




