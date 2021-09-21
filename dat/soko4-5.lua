-- NetHack 3.7  sokoban.des $NHDT-Date: 1432512784 2015/05/25 00:13:04 $  $NHDT-Branch: master $:$NHDT-Revision: 1.13 $
--  Copyright (c) 1998-1999 by Kevin Hugo
-- NetHack may be freely redistributed.  See license for details.
--
des.level_init({ style = "solidfill", fg = " " });
des.level_flags("mazelevel", "noteleport", "hardfloor", "premapped", "solidify", "noflip");
-- https://nethackwiki.com/wiki/Sokoban_Level_1c
-- authorship may be Thinking Rabbit
-- with edits from paxed/patr
des.map([[
 --------       
 |......|       
 |......-----   
 |---.......|   
 |..--.|....|   
 |.....|.|.-----
 |.--..........|
--.||..|...|...|
|..-------------
|.........|     
-----------     
]]);
des.levregion({ region = {6,5,6,5}, type = "branch" })
des.stair("up", 9,9)
des.region(selection.area(00,00,15,10),"lit")
des.non_diggable(selection.area(00,00,15,10))
des.non_passwall(selection.area(00,00,15,10))

-- A little help
des.object("earth",14,6)
des.object("earth",14,7)

-- Boulders
des.object("boulder",4,2)
des.object("boulder",8,3)
des.object("boulder",6,4)
des.object("boulder",9,4)
des.object("boulder",6,6)
des.object("boulder",8,6)
des.object("boulder",10,6)
des.object("boulder",11,6)

-- Traps
des.trap("pit",2,6)
des.trap("pit",2,7)
des.trap("pit",4,9)
des.trap("pit",5,9)
des.trap("pit",6,9)
des.trap("pit",7,9)
des.trap("pit",8,9)

-- Random objects
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "=" });
des.object({ class = "/" });
