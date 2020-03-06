-- Mephisto's lair
--
des.level_init({ style = "solidfill", fg = " " });

des.level_flags("mazelevel");
des.map([[
-------.................................................LLLLLLLLLLLLLLLLLLL
|.....|......--------------|--------------------------...LLLLLLLLLLLLLLLLLL
|.....|....................|---|...........|---......|...........LLLLLLLLLL
|.....|------------........||.................|......|L..........LLLLLLLLLL
|.....+....................|-...LL.......LL...--.....|LLLLLLLLL..LLLLLLLLLL
---+-----------------------|...LLLL.....LLLL...|.....|LLLLLLLLL......LLLLLL
..|.|......................|...LLLL.....LLLL...|.....|LLLLLLLLL......LLLLLL
..|.|.|.|.|---------------.|-...LL.......LL...-|.....|LLLLLLLLLLLLL..LLLLLL
..|.|.|.|.|..............|.||........L........|......|LLLLLLLLLLLLL..LLLLLL
..|.|.|.|.|.|-----.......|.|---.....LLL.....---......|...............LLLLLL
..|.|.|.|.|.|....|..|.|..|.|..|---.......---|........+...............LLLLLL
..|.|.|.|.|.|..|.|..|.|..|.|.....|.|.|.|.|...........|---------------------
..|.-----.|.|..--|..|.|..|.|.....|.|.|.|.|...........|..|..................
..|.......|.|.......|.|..|.|.....|+-----+|...........|..|.|---------------.
..---------.--------------.|.........|...............|..|.|................
...........................-+------------------------|..|.|..|.|.|.|.|.|.|.
...........................|............................-.---------------|.
.-----------------------------------------------------...................|.
.....................................................|--------------------.
...........................................................................
]]);
des.non_diggable(selection.area(00,00,75,19))
des.region(selection.area(00,00,75,19), "unlit")
des.stair("down", 37,05)
des.stair("up", 04,04)
--
des.door("locked",06,04)
des.door("locked",03,05)
des.door("locked",53,10)
des.door("locked",34,13)
des.door("locked",40,13)
des.door("locked",28,15)
--
des.monster({class="&", x=07, y=00})
des.monster({class="&", x=08, y=00})
des.monster({class="&", x=09, y=00})
des.monster({class="&", x=10, y=00})
des.monster({class="&", x=11, y=00})
des.monster({class="&", x=12, y=00})
des.monster({class="&", x=07, y=01})
des.monster({class="&", x=08, y=01})
des.monster({class="&", x=09, y=01})
des.monster({class="&", x=10, y=01})
des.monster({class="&", x=11, y=01})
des.monster({class="&", x=12, y=01})
des.monster({class="&", x=07, y=02})
des.monster({class="&", x=08, y=02})
des.monster({class="&", x=09, y=02})
des.monster({class="&", x=10, y=02})
des.monster({class="&", x=11, y=02})
des.monster({class="&", x=12, y=02})
--
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster({id="mephisto", x=37, y=05})
--
des.object()
des.object()
des.object()
des.object()
des.object()
des.object()
des.object()
des.object()
des.object()
des.object()
des.object()
des.object()
--
des.trap("land mine")
des.trap("land mine")
des.trap("land mine")
des.trap("land mine")
des.trap("land mine")
des.trap("land mine")
des.trap("land mine")
des.trap("land mine")
des.trap("land mine")
des.trap("land mine")
des.trap()
des.trap()
des.trap()
des.trap()
des.trap()
des.trap()
des.trap()
des.trap()
des.trap()