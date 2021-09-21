-- NetHack 3.7  sokoban.des $NHDT-Date: 1432512784 2015/05/25 00:13:04 $  $NHDT-Branch: master $:$NHDT-Revision: 1.13 $
--  Copyright (c) 1998-1999 by Kevin Hugo
-- NetHack may be freely redistributed.  See license for details.
--
des.level_init({ style = "solidfill", fg = " " });
des.level_flags("mazelevel", "noteleport", "hardfloor", "premapped", "solidify", "noflip");
-- a gentler version of https://nethackwiki.com/wiki/Sokoban_Level_1f
-- like other "1" levels, now has a spare boulder and can now be solved in < 150 moves

-- authorship may be Hiroyuki Imabayashi, the original 1982 sokoban developer
-- thinking rabbit republished sokoban in 1988, and added some levels
des.map([[
-----------------
|.......|...--..|
|.-----.|.......|
|.---...|.......|
|...........--..|
|......--...||..|
|F-F-F-------|.-|
|...........|-..|
|.....-------...|
|P..............|
|.....-------...|
|.....|     |...|
-------     -----
]]);
des.levregion({ region = {01,05,01,05}, type = "branch" })
des.stair("up", 11,07)
des.region(selection.area(00,00,16,12),"lit")
des.non_diggable(selection.area(00,00,16,12))
des.non_passwall(selection.area(00,00,16,12))

-- A little help
des.object("earth",14,01)
des.object("earth",15,01)

-- Boulders
des.object("boulder",12,02)
des.object("boulder",06,03)
des.object("boulder",12,03)
des.object("boulder",06,04)
des.object("boulder",07,04)
des.object("boulder",14,04)
des.object("boulder",14,07)
des.object("boulder",12,09)
des.object("boulder",13,09)
des.object("boulder",14,10)

-- Traps
des.trap("pit",07,07)
des.trap("pit",08,07)
des.trap("pit",09,07)
des.trap("pit",10,07)
des.trap("pit",07,09)
des.trap("pit",08,09)
des.trap("pit",09,09)
des.trap("pit",10,09)
des.trap("pit",11,09)

-- Random objects
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "=" });
des.object({ class = "/" });
