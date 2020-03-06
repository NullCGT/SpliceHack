--
des.level_init({ style = "solidfill", fg = " " });

des.level_flags("mazelevel");

des.level_flags("noteleport", "hardfloor", "shortsighted")
-- The following messages are somewhat obtuse, to make then
-- equally meaningful if the player can see or not.
des.message("Dark clouds whirl angrily around you, and claws of lightning arc across the sky!")
-- The player lands, upon arrival, in the
-- lower-left area.  The location of the
-- portal to the next level is randomly chosen.
-- This map has no visible outer boundary, and
-- is all "air".
des.map([[
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
]]);
-- Use up and down regions to partition the level into three parts;
-- teleportation can't cross from one part into another.
-- The up region is where you'll arrive after activating the portal from
-- the preceding level; the exit portal is placed inside the down region.
des.teleport_region({ region = {01,00,24,20}, region_islev = 1, exclude = {25,00,79,20}, exclude_islev=1, dir="up" })
des.teleport_region({ region = {56,00,79,20}, region_islev = 1, exclude = {01,00,55,20}, exclude_islev=1, dir="down" })
des.levregion({ region = {57,01,78,19}, region_islev=1, type="portal", name="fire" });
des.monster({ id = "air elemental", peaceful=0 })
des.monster({ id = "air elemental", peaceful=0 })
des.monster({ id = "air elemental", peaceful=0 })
des.monster({ id = "air elemental", peaceful=0 })
des.monster({ id = "air elemental", peaceful=0 })
des.monster({ id = "air elemental", peaceful=0 })
des.monster({ id = "air elemental", peaceful=0 })
des.monster({ id = "storm elemental", peaceful=0 })
des.monster({ id = "storm elemental", peaceful=0 })
des.monster({ id = "storm elemental", peaceful=0 })
des.monster({ id = "storm elemental", peaceful=0 })
des.monster({ id = "storm elemental", peaceful=0 })
des.monster({ id = "storm elemental", peaceful=0 })
des.monster({ id = "storm elemental", peaceful=0 })
des.monster({ id = "storm elemental", peaceful=0 })
des.monster({ id = "storm elemental", peaceful=0 })

des.monster("D")
des.monster("D")
des.monster("D")
des.monster("D")
des.monster("D")
des.monster("D")
des.monster("D")

-- Monsters flung about by the whirlwind
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()
des.monster()

des.monster({ id = "energy vortex", peaceful=0 })
des.monster({ id = "energy vortex", peaceful=0 })
des.monster({ id = "energy vortex", peaceful=0 })
des.monster({ id = "energy vortex", peaceful=0 })
des.monster({ id = "energy vortex", peaceful=0 })
des.monster({ id = "energy vortex", peaceful=0 })
des.monster({ id = "energy vortex", peaceful=0 })
des.monster({ id = "energy vortex", peaceful=0 })
des.monster({ id = "steam vortex", peaceful=0 })
des.monster({ id = "steam vortex", peaceful=0 })
des.monster({ id = "ice vortex", peaceful=0 })
des.monster({ id = "ice vortex", peaceful=0 })