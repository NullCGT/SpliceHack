-- NetHack 3.7	tower.des	$NHDT-Date: 1432512784 2015/05/25 00:13:04 $  $NHDT-Branch: master $:$NHDT-Revision: 1.9 $
--	Copyright (c) 1989 by Jean-Christophe Collet
-- NetHack may be freely redistributed.  See license for details.
--
des.level_init({ style = "solidfill", fg = " " });

des.level_flags("noteleport", "hardfloor", "solidify", "noflipx")
des.map({ halign = "half-left", valign = "center", map = [[
gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
gggggggggggggggggggg-----------------ggggggggg---.---.---ggggggggggggggggg
gggggggggggggggggggg|..+.........+..|ggggggggg|.|.|.|.|.|ggggggggggggggggg
gggggggggggggggggggg---|......-----------------S---S---S---ggggggggggggggg
ggggggggggggggggggggggg|......|.............|.S.........S.|ggggggggggggggg
gggggg.................|......|.............---.------+----ggggggggggggggg
.......................+......+...............+......|..|ggggggggggggggggg
........ggggggggggggggg|......|.............--------.------ggggggggggggggg
ggggggggggggggggggggggg|......|.............|.S......+..S.|ggggggggggggggg
gggggggggggggggggggg---|......-----------------S---S---S---ggggggggggggggg
gggggggggggggggggggg|..+.........+..|ggggggggg|.|.|.|.|.|ggggggggggggggggg
gggggggggggggggggggg-----------------ggggggggg---.---.---ggggggggggggggggg
gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
]] });
-- Add trees
des.replace_terrain({ region={00,00, 75,19}, fromterrain="g", toterrain="T", chance=10 })
-- Random places are the 10 niches
local place = { {47,05},{51,05},{55,05},{45,07},{54,07},
{45,011},{57,011},{47,13},{51,13},{55,13} }

des.levregion({ type="branch", region={06,09,06,09} })
des.ladder("up", 55,09)
-- All doors are, of course, locked
des.door("locked",23,05)
des.door("locked",23,09)
des.door("locked",33,05)
des.door("locked",33,13)
des.door("locked",23,13)
des.door("locked",30,09)
des.door("locked",46,09)
des.door("locked",54,08)
des.door("locked",53,11)
-- Let's put a dragon behind the door, just for the fun...
des.monster("D", 45, 09)
des.monster("panther", 44, 09)
-- The legions of Vlad...
des.monster({ x=0, y=05 })
des.monster({ x=11, y=12 })
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('Z')
des.monster('M')
des.monster('M')
des.monster('M')
des.monster('M')
des.monster('gorgon head')
des.monster('gorgon head')
des.monster('gorgon head')
des.monster("Alucard", 35,10)
des.object("long sword",place[4])
des.trap({ coord = place[4] })
des.object("lock pick",place[1])
des.trap({ coord = place[1] })
des.object("elven cloak",place[2])
des.trap({ coord = place[2] })
des.object("blindfold",place[3])
des.trap({ coord = place[3] })
-- Walls in the tower are non diggable
des.non_diggable(selection.area(00,00,75,19))
