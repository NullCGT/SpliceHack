-- NetHack 3.7  sokoban.des $NHDT-Date: 1432512784 2015/05/25 00:13:04 $  $NHDT-Branch: master $:$NHDT-Revision: 1.13 $
--  Copyright (c) 1998-1999 by Kevin Hugo
-- NetHack may be freely redistributed.  See license for details.
--
des.level_init({ style = "solidfill", fg = " " });

des.level_flags("mazelevel", "noteleport", "premapped", "solidify", "noflip");
-- https://nethackwiki.com/wiki/Sokoban_Level_4d
-- reduced holes by 1, to allow for small mistakes
-- moved the zoo & rewards, but the wiki solution still works fine
des.map([[
  -----------    
 L.+......+.|    
  -|......|------
.L.+......+.....|
  -|......|----.|
 L.+......+.| |.|
|-------------|.|
|.....|...|...|.|
|.............|.|
|....------.|.|.|
|....|...|....|.|
|....|.......-|.|
-----|.--..---|.|
 |...|.....+..F.|
 |........-|..F.|
 |-.----.---FF-.|
 |..............|
 |...|...-----..|
 ---------   ----
]]);

local place = selection.new();
place:set(02,01);
place:set(02,03);
place:set(02,05);
place:set(11,01);
place:set(11,05);

des.stair("down",06,10);
des.region(selection.area(00,00,17,17),"lit");
des.non_diggable(selection.area(00,00,17,18));
des.non_passwall(selection.area(00,00,17,18));

-- Boulders
des.object("boulder",02,08);
des.object("boulder",03,08);
des.object("boulder",06,08);
des.object("boulder",10,08);
des.object("boulder",12,08);
des.object("boulder",03,09);
des.object("boulder",02,10);
des.object("boulder",03,10);
des.object("boulder",12,10);
des.object("boulder",08,11);
des.object("boulder",06,12);
des.object("boulder",07,13);
des.object("boulder",06,14);
des.object("boulder",04,16);
des.object("boulder",08,16);
des.object("boulder",09,16);

-- Traps
des.trap("hole",15,04)
des.trap("hole",15,05)
des.trap("hole",15,06)
des.trap("hole",15,07)
des.trap("hole",15,08)
des.trap("hole",15,09)
des.trap("hole",15,10)
des.trap("hole",15,11)
des.trap("hole",15,12)
des.trap("hole",15,13)
des.trap("hole",15,14)
des.trap("hole",15,15)
des.trap("hole",14,16)
des.trap("hole",12,16)
des.trap("hole",10,16)

des.monster({ id = "giant mimic", appear_as = "obj:boulder" });
des.monster({ id = "giant mimic", appear_as = "obj:boulder" });

-- Random objects
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "%" });
des.object({ class = "=" });
des.object({ class = "/" });

-- Rewards
des.door("locked",10,03)
des.door("closed",10,05)
des.door("closed",10,01)
des.door("closed",03,03)
des.door("closed",03,05)
des.door("closed",03,01)
des.door("locked",11,13)
des.region({ region={04,01,09,05}, lit = 1, type = "zoo", filled = 1, irregular = 1 });

px, py = selection.rndcoord(place);
if percent(50) then
   des.object({ id="bag of holding", x=px, y=py,
        buc="not-cursed", achievement=1 });
else
   des.object({ id="amulet of reflection", x=px, y=py,
        buc="not-cursed", achievement=1 });
end
des.engraving({ x = px, y = py, type = "burn", text = "Elbereth" });
des.object({ id = "scare monster", x = px, y = py, buc = "cursed" });

des.feature("furnace",00,03) -- inspired by nDNH, jazz up soko with lava and a furnace
