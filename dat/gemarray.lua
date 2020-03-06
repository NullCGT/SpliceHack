-- The gemstone array is rocked by repeated earthquakes, making it very annoying
-- to navigate.
--
des.level_init({ style = "solidfill", fg = " " });

des.level_flags("mazelevel");

des.level_flags("noteleport", "hardfloor", "shortsighted")
des.message("The air is filled with the rumbling of shifting stone!")
des.map([[
                                                                            
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
                                                                            
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
                                                                            
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
                                                                            
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
                                                                            
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
 ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...   ...
]]);

--des.portal((0,0,75,19),(65,13,75,19),"air")
des.levregion({ region = {0,0,75,19}, region_islev=1, type="portal", name="air" });

-- Denizens
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})
des.monster({ id = "earth elemental", peaceful = 0})

des.monster({ id = "ruby golem",random, peaceful = 0})
des.monster({ id = "ruby golem",random, peaceful = 0})
des.monster({ id = "ruby golem",random, peaceful = 0})
des.monster({ id = "sapphire golem",random, peaceful = 0})
des.monster({ id = "sapphire golem",random, peaceful = 0})
des.monster({ id = "sapphire golem",random, peaceful = 0})
des.monster({ id = "crystal golem",random, peaceful = 0})
des.monster({ id = "crystal golem",random, peaceful = 0})
des.monster({ id = "crystal golem",random, peaceful = 0})

des.monster({ id = "hundred handed one", peaceful = 0})
des.monster({ id = "titan", peaceful = 0})

-- Many boulders, making navigation difficult.
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")
des.object("boulder")

-- Falling rock traps everywhere.
des.trap("falling rock")
des.trap("falling rock")
des.trap("falling rock")
des.trap("falling rock")
des.trap("falling rock")
des.trap("falling rock")
des.trap("falling rock")
des.trap("falling rock")
des.trap("falling rock")
des.trap("falling rock")
des.trap("falling rock")
des.trap("falling rock")
des.trap("falling rock")

-- Gemstones
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("diamond")
des.object("ruby")
des.object("ruby")
des.object("ruby")
des.object("ruby")
des.object("ruby")
des.object("ruby")
des.object("ruby")
des.object("sapphire")
des.object("sapphire")
des.object("sapphire")
des.object("sapphire")
des.object("sapphire")
des.object("sapphire")
des.object("sapphire")