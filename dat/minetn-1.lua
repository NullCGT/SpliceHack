-- NetHack 3.7	mines.des	$NHDT-Date: 1432512783 2015/05/25 00:13:03 $  $NHDT-Branch: master $:$NHDT-Revision: 1.25 $
--	Copyright (c) 1989-95 by Jean-Christophe Collet
--	Copyright (c) 1991-95 by M. Stephenson
-- NetHack may be freely redistributed.  See license for details.
--
-- A tragic accident has occurred in Frontier Town....
--
-- Minetown variant 1
-- Orcish Town - a variant of Frontier Town that has been
-- overrun by orcs.  Note the barricades (iron bars).

des.level_flags("inaccessibles")

des.level_init({ style="mines", fg=".", bg=" ", smoothed=true, joined=true, walled=true })

des.map([[
.....................................
.----------------.------------------.
.|.................................|.
.|.-------------......------------.|.
.|.|...|...|...|......|..|...|...|.|.
...|...|...|...|......|..|...|...|.|.
.|.|...|...|...|......|..|...|...|...
.|.|...|...|----......------------.|.
.|.---------.......................|.
.|.................................|.
.|.---------.....--...--...........|.
.|.|...|...|----.|.....|.---------.|.
.|.|...|...|...|.|.....|.|..|....|.|.
.|.|...|...|...|.|.....|.|..|....|.|.
.|.|...|...|...|.|.....|.|..|....|.|.
.|.-------------.-------.---------...
.|.................................|.
.-----------.------------.----------.
.....................................
]])

-- Don't let the player fall into their likely death; used to explicitly exclude
-- the town, but that meant that you couldn't teleport out as well as not in.
des.teleport_region({ region={01,01,20,19}, region_islev=1 })
des.region(selection.area(01,01,35,17), "lit")
des.levregion({ type="stair-up", region={01,03,20,19}, region_islev=1,
      exclude={00,01,36,17} })
des.levregion({ type="stair-down", region={61,03,75,19}, region_islev=1,
      exclude={00,01,36,17} })

-- shame we can't make polluted fountains
des.feature("fountain",16,09)
des.feature("fountain",25,09)

-- the altar's defiled; useful for BUC but never coaligned
des.altar({ x=20,y=13,align="noalign", type="shrine" })

-- set up the shop doors; could be broken down
des.door("random",5,8)
des.door("random",9,8)
des.door("random",13,7)
des.door("random",22,5)
des.door("random",27,7)
des.door("random",31,7)
des.door("random",5,10)
des.door("random",9,10)
des.door("random",15,13)
des.door("random",25,13)
des.door("random",31,11)

-- knock a few holes in the shop interior walls
des.replace_terrain({ region={07,04,11,06}, fromterrain="|", toterrain=".", chance=18 })
des.replace_terrain({ region={25,04,29,06}, fromterrain="|", toterrain=".", chance=18 })
des.replace_terrain({ region={07,12,11,14}, fromterrain="|", toterrain=".", chance=18 })
des.replace_terrain({ region={28,12,28,14}, fromterrain="|", toterrain=".", chance=33 })

-- Rubble!
for i=1,6 + math.random(2 - 1,2*5) do
  if percent(90) then
    des.object("boulder")
  end
  des.object("rock")
end

-- one set of bars is replaced with a boulder
local bars = { {17,1}, {1,5}, {35,6}, {35,15}, {12,17}, {25,17} }
shuffle(bars)
des.object({ id = "boulder", coord = bars[1] })
for pos=2,6 do
   des.terrain(bars[pos], "F")
end

-- scatter a lot of bodies
des.object({ id = "corpse", montype="watchman" })
des.object({ id = "corpse", montype="watchman" })
des.object({ id = "corpse", montype="watchman" })
des.object({ id = "corpse", montype="watchman" })
des.object({ id = "corpse", montype="watch captain" })
des.object({ id = "corpse", montype="gnome" })
des.object({ id = "corpse", montype="gnome" })
des.object({ id = "corpse", montype="gnome" })
des.object({ id = "corpse", montype="gnomish wizard" })
des.object({ id = "corpse", montype="gnome leader" })
des.object({ id = "corpse", montype="dwarf" })
des.object({ id = "corpse", montype="dwarf" })
des.object({ id = "corpse", montype="Uruk-hai" })
des.object({ id = "corpse", montype="hill orc" })
des.object({ id = "corpse", montype="hill orc" })
des.object({ id = "corpse", montype="hill orc" })
des.object({ id = "corpse", montype="hill orc" })
des.object({ id = "corpse", montype="goblin" })
des.object({ id = "corpse", montype="goblin" })
des.object({ id = "corpse", montype="goblin" })
des.object({ id = "corpse", montype="goblin" })
-- One murder each in most shops...
local demise = { {05,04},{09,05},{13,04},{26,04},{31,05},{30,14},{05,14},{10,13},{26,14},{27,13} }
shuffle(demise)
des.object({ id = "corpse", coord = demise[1], montype="shopkeeper" })
des.object({ id = "corpse", coord = demise[2], montype="shopkeeper" })
des.object({ id = "corpse", coord = demise[3], montype="shopkeeper" })
des.object({ id = "corpse", coord = demise[4], montype="shopkeeper" })
des.object({ id = "corpse", coord = demise[5], montype="shopkeeper" })

-- Guarantee 7 candles since we won't have Izchak available
des.object({ id = "wax candle", coord = demise[4], quantity = math.random(1,2) })
des.object({ id = "wax candle", coord = demise[1], quantity = math.random(2,4) })
des.object({ id = "wax candle", coord = demise[2], quantity = math.random(1,2) })
des.object({ id = "tallow candle", coord = demise[3], quantity = math.random(1,3) })
des.object({ id = "tallow candle", coord = demise[2], quantity = math.random(1,2) })
des.object({ id = "tallow candle", coord = demise[4], quantity = math.random(1,2) })

-- some shopkeepers were cut down before their wands ran out
des.object({ id = "striking", coord = demise[1], buc="uncursed", spe=d(8) })
des.object({ id = "striking", coord = demise[4], buc="uncursed", spe=d(6) })
des.object({ id = "striking", coord = demise[5], buc="uncursed", spe=d(4) })
des.object({ id = "magic missile", coord = demise[4], buc="uncursed", spe=d(6) })
des.object({ id = "magic missile", coord = demise[5], buc="uncursed", spe=d(4) })

-- put safety boulders atop the shopkeepers who died with remaining wand charges
des.object({ id = "boulder", coord = demise[1] })
des.object({ id = "boulder", coord = demise[4] })
des.object({ id = "boulder", coord = demise[5] })

-- and don't shopkeepers carry keys?
des.object({ id = "skeleton key", coord = demise[2] })
des.gold({ coord = demise[3] })

-- resourceful orcs have set up a kitchen, and are preparing to
-- "process" the former residents of minetown to feed the troops
-- kitchen internal area: 12,04 to 14,06
des.object({ id = "large box", x = 12, y = 04, -- Pantry: dry kitchen storage
    contents = function()
    if percent (75) then
    des.object('knife')
    end
    if percent (75) then
    des.object("tin opener")
    end
    for i = 1, d(4)-1 do
    des.object({ class='%', id='clove of garlic' })
    end
    if percent (75) then
    des.object({ class='!', id='oil' })
    end
    for i = 1, d(4)-1 do
    des.object({ class='!', id='fruit juice' })
    end
    for i = 1, d(4)-1 do
    des.object({ class='!', id='booze' })
    end
    des.object({ class = "(" }) -- one surprise
end
})
des.object({ id = "ice box", x = 12, y = 05, -- Fridge: cold kitchen storage
    contents = function()
    for i = 1, d(4)-1 do
    des.object({ class='%', id='egg' })
    end
    for i = 1, d(4)-1 do
    des.object({ id = "corpse", montype = "gnome" })
    end
    for i = 1, d(3)-1 do
    des.object({ id = "corpse", montype = "dwarf" })
    end
    for i = 1, d(3)-1 do
    des.object({ id = "corpse", montype = "human" })
    end
    for i = 1, d(2)-1 do
    des.object({ id = "corpse", montype = "goblin" })
    end
    for i = 1, d(2)-1 do
    des.object({ id = "corpse", montype = "orc-captain" })
    end
    des.object({ id = "corpse" }) -- one surprise
    des.object({ class = "%" })   -- and another!
end
})
des.feature("furnace",  13,04)
des.feature("sink",     14,04)
des.object("dented pot", 13, 05)
if percent (75) then
des.object("apron", 13, 05)
end
des.monster({ id = "goblin", x = 13, y = 05, peaceful = 1,
        name = "Cookie of Glothris",  }) -- the chef. not a warrior.

-- the Orcish Army

local inside = selection.floodfill(18,8)
local near_temple = selection.area(17,8, 23,14) & inside

for i=1,5 + math.random(1 - 1,1*10) do
   if percent(50) then
      des.monster({ id = "orc-captain", coord = { inside:rndcoord(1) }, peaceful=0 })
   else
      if percent(80) then
         des.monster({ id = "Uruk-hai", coord = { inside:rndcoord(1) }, peaceful=0 })
      else
         des.monster({ id = "Mordor orc", coord = { inside:rndcoord(1) }, peaceful=0 })
      end
   end
end
-- shamans can be hanging out in/near the temple
for i=1,math.random(2 - 1,2*3) do
   des.monster({ id = "orc shaman", coord = { near_temple:rndcoord(0) }, peaceful=0 })
end
-- these are not such a big deal
-- to run into outside the bars
for i=1,9 + math.random(2 - 1,2*5) do
   if percent(90) then
      des.monster({ id = "hill orc", peaceful = 0 })
   else
      des.monster({ id = "goblin", peaceful = 0 })
   end
end

-- go ahead and leave a lamp somewhere, with the normal probability of magic
if percent (75) then
   des.object({ id = "oil lamp", lit = 1 })
else
   des.object({ id = "magic lamp", lit = 1 })
end

-- and an ex-priest
local excommunicated = { 18+d(3), 11+d(3) }
des.object({ id = "corpse", coord = excommunicated, montype="aligned cleric" })
des.object({ id = "mace", coord = excommunicated })
des.object({ id = "small shield", coord = excommunicated })
des.gold()
if percent(85) then
   des.object({ id = "robe", coord = excommunicated })
elseif percent(67) then
   des.object({ id = "cloak of protection", coord = excommunicated })
else
   des.object({ id = "cloak of magic resistance", coord = excommunicated })
end
for i = 1, 1 + math.random(1,2) do
  des.object({ class = "+", coord = excommunicated })
end

-- Hack to force full-level wallification

des.wallify()
