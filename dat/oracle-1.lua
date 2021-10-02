
des.level_flags("noflip");

des.room({ type = "delphi", lit=1, x=3,y=3, xalign="center",yalign="center", w=11,h=9, contents = function()
-- 16 centaurs, 8 other possibilities. 1/3 chance of non-centaur.
local monster = { "C", "C", "C", "C", "C", "C", "C", "C", "C", "C", "C", "C", "C", "C", "C", "C",
                  "manticore", "manticore", "chimera", "chimera", "q", "q", "woodchuck", "archeologist" }
-- 4 fountains that have a 1% chance to be sinks instead
local founts = { {0, 1}, {1, 0}, {1, 2}, {2, 1} }

shuffle(monster)
              des.object({ id = "statue", x = 0, y = 0, montype = monster[1], historic = true });
              des.object({ id = "statue", x = 0, y = 8, montype = monster[1], historic = true });
              des.object({ id = "statue", x =10, y = 0, montype = monster[1], historic = true });
              des.object({ id = "statue", x =10, y = 8, montype = monster[1], historic = true });
              des.object({ id = "statue", x = 5, y = 1, montype = monster[1], historic = true });
              des.object({ id = "statue", x = 5, y = 7, montype = monster[1], historic = true });
              des.object({ id = "statue", x = 2, y = 4, montype = monster[1], historic = true });
              des.object({ id = "statue", x = 8, y = 4, montype = monster[1], historic = true });

              des.room({ type = "delphi", lit = 1, x=4,y=3, w=3,h=3, contents = function()
                    for pos=1,4 do
                        if percent(99) then
                            des.feature("fountain", founts[pos]);
                        else
                            des.feature("sink", founts[pos]);
                        end
                    end
                    des.monster("Oracle", 1, 1);
                    des.door({ state="nodoor", wall="all" });
                 end
              });

              des.monster();
              des.monster();
           end
});

des.room({ contents = function()
                 des.stair("up");
                 des.object();
              end
});

des.room({ contents = function()
                 des.stair("down");
                 des.object();
                 des.trap();
                 des.monster();
                 des.monster();
              end
});

des.room({ contents = function()
                 des.object();
                 des.object();
                 des.monster();
              end
});

des.room({ contents = function()
                 des.object();
                 des.trap();
                 des.monster();
              end
});

des.room({ contents = function()
                 des.object();
                 des.trap();
                 des.monster();
              end
});

des.random_corridors();
