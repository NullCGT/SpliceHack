-- The foocubus level
--
des.level_init({ style = "solidfill", fg = " " });

des.level_flags("mazelevel", "nommap")
des.map([[
..........................T........}}}}}}}}}}}........|--------------------|
.................T...................}}}}}}}}}..T.....|......S.............|
.....T......T........T.......T........}}}}}}}}}.....T.|......|.............|
.........T.....T..................T.......}}}}}.......|......|.............|
..T.........................T..............}}}}..T....S......|.............|
............T.........T.................T..}}}}...T...|......|.............|
............................................}}}}......|......|.............|
......T.........T........T.....T.............}}}}.....|---S---------------S|
.......................TTTT........T.........}}}}}}}}}|......|.............|
..........T.....T......TTT...................}}}}}}}}}|......|.............|
....T........T.....T....TT..T.....T.........}}}}}.....|---S---------------S|
T.......T.............T.................T...}}}}}.....|......|.............|
TT.............T.........T.TT...............}}}}}..T..|......|.............|
TT..T.............................T..........}}}T.....|......|.............|
TT.....T.....T........T...T...T.......T......}}}......|......|.............|
T.........T........T.........................}}}}...T.|......|.............|
.....T.........T...............T.........T....}}}}....|......S.............|
.......................T............T.........}}}}}...|--------------------|
...........T..............T.......T...........}}}}}}..............T.........
T......T.T...T........T................T......}}}}}.......T...........T.....
]]);
des.non_diggable(selection.area(00,00,75,19))
des.region(selection.area(00,00,75,19), "unlit")
des.drawbridge({dir="east",state="closed",x=53,y=08})
des.drawbridge({dir="east",state="closed",x=53,y=09})
des.stair("up", 02,08)
des.stair("down", 56,08)
-- random monsters in random spots
des.monster("succubus")
des.monster("wood nymph")
des.monster("wood nymph")
des.monster("wood nymph")
des.monster()
des.monster()
des.monster()
des.monster()
des.monster("incubus")
des.monster("wood nymph")
des.monster("wood nymph")
des.monster("wood nymph")
des.monster("wood nymph")
des.monster()
des.monster()
des.monster()
des.monster()
des.monster({class=";", x=45, y=09})
des.monster({class=";", x=44, y=06})
des.monster({class=";", x=40, y=00})
-- the demon lord and their gaurdians
des.monster({id="Malcanthet", x=56, y=08})
des.monster({id="succubus", x=57, y=08})
des.monster({id="succubus", x=62, y=03})
-- traps and objects
des.object()
des.object()
des.object()
des.object()
des.object()
des.object()
des.object()
des.object()
des.object()
des.trap()
des.trap()
des.trap()
des.trap()
des.trap()
des.trap()
des.trap()
des.trap()
des.trap()
des.trap()