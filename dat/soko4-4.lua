-- NetHack 3.7  sokoban.des $NHDT-Date: 1432512784 2015/05/25 00:13:04 $  $NHDT-Branch: master $:$NHDT-Revision: 1.13 $
--  Copyright (c) 1998-1999 by Kevin Hugo
-- NetHack may be freely redistributed.  See license for details.
--
des.level_init({ style = "solidfill", fg = " " });
des.level_flags("mazelevel", "noteleport", "hardfloor", "premapped", "solidify", "noflip");
-- https://nethackwiki.com/wiki/Sokoban_Level_1c
-- authorship may be J Franklin Mentzer, with edits from paxed/patr
des.map([[
     -------                 
     |..|..|     --------    
------.....--- ---......---  
|......---...| |..........|  
|.|.|......|.--|........|.---
|.|.--..|..|...-F-F-F-F--...|
|.......|...................|
|.|.--..|..|...-F-F-F-F--...|
|.|.|......|.--|........|.---
|......---...| |..........|  
------.....--- ---......---  
     |..|..|     --------    
     -------                 
]]);
des.levregion({ region = {13,6,13,6}, type = "branch" })
des.stair("up", 26,6)
des.region(selection.area(00,00,28,12),"lit")
des.non_diggable(selection.area(00,00,28,12))
des.non_passwall(selection.area(00,00,28,12))

-- A little help
des.object("earth",16,3)
des.object("earth",16,9)

des.object("boulder",8,2)
des.object("boulder",8,4)
des.object("boulder",3,5)
des.object("boulder",6,6)
des.object("boulder",7,6)
des.object("boulder",9,6)
des.object("boulder",10,6)
des.object("boulder",3,7)
des.object("boulder",8,8)
des.object("boulder",8,10)

des.trap("pit",15,6)
des.trap("pit",16,6)
des.trap("pit",17,6)
des.trap("pit",18,6)
des.trap("pit",19,6)
des.trap("pit",20,6)
des.trap("pit",21,6)
des.trap("pit",22,6)
des.trap("pit",23,6)

-- Random objects
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "=" });
des.object({ class = "/" });
