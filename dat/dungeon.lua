
dungeon = {
   {
      name = "The Dungeons of Doom",
      bonetag = "D",
      base = 25,
      range = 5,
      alignment = "unaligned",
      themerooms = "themerms.lua",
      branches = {
         {
            name = "The Gnomish Mines",
            base = 2,
            range = 3
         },
         {
            name = "Sokoban",
            chainlevel = "oracle",
            base = 1,
            direction = "up"
         },
         {
            name = "The Quest",
            chainlevel = "oracle",
            base = 6,
            range = 2,
            branchtype = "portal"
         },
         {
            name = "Fort Ludios",
            base = 18,
            range = 4,
            branchtype = "portal"
         },
         {
            name = "The Icy Wastes",
            base = 15,
            range = 8,
            branchtype = "portal"
         },
         {
            name = "The Dark Forest",
            base = 15,
            range = 8
         },
         {
            name = "Mysterious Laboratory",
            base = 20,
            range = 5
         },
         {
            name = "One-eyed Sam's Market",
            base = 20,
            range = 5,
            branchtype = "portal"
         },
         {
            name = "Gehennom",
            chainlevel = "castle",
            base = 0,
            branchtype = "no_down"
         },
         {
            name = "The Elemental Planes",
            base = 1,
            branchtype = "no_down",
            direction = "up"
         }
      },
      levels = {
         {
            name = "rogue",
            bonetag = "R",
            base = 15,
            range = 4,
            flags = "roguelike",
         },
         {
            name = "oracle",
            bonetag = "O",
            base = 5,
            range = 5,
            alignment = "neutral"
         },
         {
            name = "bigrm",
            bonetag = "B",
            base = 10,
            range = 3,
            chance = 40,
            nlevels = 10
         },
         {
            name = "statuary",
            bonetag = "S",
            base = 18,
            range = 2,
            chance = 40
         },
         {
            name = "bigrm",
            bonetag = "B",
            base = 20,
            range = 3,
            chance = 40,
            nlevels = 10
         },
         {
            name = "medusa",
            base = -5,
            range = 4,
            nlevels = 4,
            alignment = "chaotic"
         },
         {
            name = "castle",
            base = -1
         }
      }
   },
   {
      name = "Gehennom",
      bonetag = "G",
      base = 20,
      range = 5,
      flags = { "mazelike", "hellish" },
      alignment = "noalign",
      branches = {
         {
            name = "Vlad's Tower",
            base = 9,
            range = 5,
            direction = "up"
         }
      },
      levels = {
         {
            name = "valley",
            bonetag = "V",
            base = 1
         },
         {
            name = "sanctum",
            base = -1
         },
         {
            name = "juiblex",
            bonetag = "J",
            base = 4,
            range = 4
         },
         {
            name = "foogardens",
            bonetag = "L",
            base = 2,
            range = 5
         },
         {
            name = "mephisto",
            bonetag = "M",
            base = 2,
            range = 6
         },
         {
            name = "baalz",
            bonetag = "B",
            base = 6,
            range = 4
         },
         {
            name = "asmodeus",
            bonetag = "A",
            base = 2,
            range = 6
         },
         {
            name = "wizard1",
            base = 11,
            range = 6
         },
         {
            name = "wizard2",
            bonetag = "X",
            chainlevel = "wizard1",
            base = 1
         },
         {
            name = "wizard3",
            bonetag = "Y",
            chainlevel = "wizard1",
            base = 2
         },
         {
            name = "orcus",
            bonetag = "O",
            base = 10,
            range = 6
         },
         {
            name = "fakewiz1",
            bonetag = "F",
            base = -6,
            range = 4
         },
         {
            name = "fakewiz2",
            bonetag = "G",
            base = -6,
            range = 4
         },
      }
   },
   {
      name = "The Gnomish Mines",
      bonetag = "M",
      base = 8,
      range = 2,
      alignment = "lawful",
      flags = { "mazelike" },
      lvlfill = "minefill",
      branches = {
         {
            name = "The Great Banquet Hall",
            base = -2,
            range = 0,
            direction = "up",
         },
      },
      levels = {
         {
            name = "minetn",
            bonetag = "T",
            base = 3,
            range = 2,
            nlevels = 9,
            flags = "town"
         },
         {
            name = "minend",
--          3.7.0: minend changed to no-bones to simplify achievement tracking
--          bonetag = "E"
            base = -1,
            nlevels = 3
         },
      }
   },
   {
      name = "The Quest",
      bonetag = "Q",
      base = 5,
      range = 2,
      levels = {
         {
            name = "x-strt",
            base = 1,
            range = 1
         },
         {
            name = "x-loca",
            bonetag = "L",
            base = 3,
            range = 1
         },
         {
            name = "x-goal",
            base = -1
         },
      }
   },
   {
      name = "Sokoban",
      base = 4,
      alignment = "neutral",
      flags = { "mazelike" },
      entry = -1,
      levels = {
         {
            name = "soko1",
            base = 1,
            nlevels = 2
         },
         {
            name = "soko2",
            base = 2,
            nlevels = 2
         },
         {
            name = "soko3",
            base = 3,
            nlevels = 2
         },
         {
            name = "soko4",
            base = 4,
            nlevels = 2
         },
      }
   },
   {
      name = "Fort Ludios",
      base = 1,
      bonetag = "K",
      flags = { "mazelike" },
      alignment = "unaligned",
      levels = {
         {
            name = "knox",
            bonetag = "K",
            base = -1
         }
      }
   },
   {
      name = "The Great Banquet Hall",
      base = 1,
      bonetag = "b",
      flags = { "mazelike" },
      alignment = "chaotic",
      levels = {
         {
            name = "banquet",
            bonetag = "b",
            base = -1
         }
      }
   },
   {
      name = "The Icy Wastes",
      base = 1,
      bonetag = "I",
      flags = { "mazelike" },
      alignment = "unaligned",
      levels = {
         {
            name = "icewaste",
            bonetag = "I",
            base = -1
         }
      }
   },
   {
      name = "The Dark Forest",
      base = 1,
      bonetag = "f",
      flags = { "mazelike" },
      alignment = "neutral",
      levels = {
         {
            name = "darkforest",
            bonetag = "f",
            base = -1
         }
      }
   },
   {
      name = "Mysterious Laboratory",
      base = 1,
      bonetag = "L",
      flags = { "mazelike" },
      alignment = "lawful",
      levels = {
         {
            name = "laboratory",
            bonetag = "L",
            base = -1
         }
      }
   },
   {
      name = "One-eyed Sam's Market",
      base = 1,
      bonetag = "W",
      flags = { "mazelike" },
      alignment = "chaotic",
      levels = {
         {
            name = "blkmar",
            bonetag = "W",
            base = 1
         }
      }
   },
   {
      name = "Vlad's Tower",
      base = 3,
      bonetag = "T",
      protofile = "tower",
      alignment = "chaotic",
      flags = { "mazelike" },
      entry = -1,
      levels = {
         {
            name = "tower1",
            base = 1
         },
         {
            name = "tower2",
            base = 2
         },
         {
            name = "tower3",
            base = 3
         },
      }
   },
   {
      name = "The Elemental Planes",
      bonetag = "E",
      base = 9,
      alignment = "unaligned",
      flags = { "mazelike" },
      entry = -2,
      levels = {
         {
            name = "astral",
            base = 1
         },
         {
            name = "water",
            base = 2
         },
         {
            name = "brass",
            base = 3
         },
         {
            name = "fire",
            base = 4
         },
         {
            name = "ice",
            base = 5
         },
         {
            name = "air",
            base = 6
         },
         {
            name = "gemarray",
            base = 7
         },
         {
            name = "earth",
            base = 8
         },
         {
            name = "dummy",
            base = 9
         },
      }
   },
}
