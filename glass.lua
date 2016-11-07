-- moreglass/glass.lua
local BASENAME = moreglass.BASENAME
local LIGHTMOD = moreglass.LIGHTMOD

-- [OVERIDE] default:glass
minetest.register_node(":default:glass", {
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = { "glass.png", "glass_detail.png" },
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

-- moreglass:glass_glow
moreglass.register_glass("glass_glow", {
  description = "Glow Glass",
  tiles = { "glass.png", "glass_detail.png" },
  light_source = default.LIGHT_MAX-1,
})

-- moreglass:glass_clean
moreglass.register_glass("glass_clean", {
  description = "Clean Glass",
  tiles = { "glass_clean.png", "glass_clean_detail.png" },
  recipe = {
    type = "cooking",
    output = BASENAME..":glass_clean",
    recipe = "default:glass",
    cooktime = 10,
  }
})

-- moreglass:glass_glow_c
moreglass.register_glass("glass_glow_clean", {
  description = "Clean Glow Glass",
  tiles = { "glass_clean.png", "glass_clean_detail.png" },
  light_source = default.LIGHT_MAX-1,
  recipe = {
    type = "cooking",
    output = BASENAME..":glass_clean",
    recipe = BASENAME..":glass_glow",
    cooktime = 10,
  }
})

-- [table] glass colours
local GLASS_COLOURS = {
  { hue = "Black",   dye = "black" },
  { hue = "Blue",    dye = "blue" },
  { hue = "Brown",   dye = "brown" },
  { hue = "Cyan",    dye = "cyan" },
  { hue = "Green",   dye = "green" },
  { hue = "Magenta", dye = "magenta" },
  { hue = "Orange",  dye = "orange" },
  { hue = "Pink",    dye = "pink" },
  { hue = "Red",     dye = "red" },
  { hue = "Violet",  dye = "violet" },
  { hue = "Yellow",  dye = "yellow" },
  { hue = "White",   dye = "white" }
}

-- [loop] register opaque glass
for i, glass in ipairs(GLASS_COLOURS) do
  -- register node
  moreglass.register_glass("glass_o" .. glass.dye, {
    description = glass.hue .. " Opaque Glass",
    tiles = {"glass_o" .. glass.dye .. ".png", "glass_o" .. glass.dye .. "_detail.png"},
    recipe = {
      output = "moreglass:glass_o" .. glass.dye,
      recipe = {
        {"dye:" .. glass.dye, "dye:" .. glass.dye, "dye:" .. glass.dye},
        {"dye:" .. glass.dye, "moreglass:glass_molten_large", "dye:" .. glass.dye},
        {"dye:" .. glass.dye, "dye:" .. glass.dye, "dye:" .. glass.dye}
      }
    }
  })
end

-- [loop] register opaque glow glass
for i, glass in ipairs(GLASS_COLOURS) do
  -- register node
  moreglass.register_glass("glass_glow_o" .. glass.dye, {
    description = glass.hue .. " Opaque Glow Glass",
    tiles = {"glass_o" .. glass.dye .. ".png", "glass_o" .. glass.dye .. "_detail.png"},
    light_source = default.LIGHT_MAX-1,
    recipe = {
      type = "shapeless",
  	  output = "moreglass:glass_glow_o" .. glass.dye,
  	  recipe = {"moreglass:glass_o" .. glass.dye, "moreglass:lightbulb"}
    }
  })
end

-- [loop] register stained glass
for i, glass in ipairs(GLASS_COLOURS) do
  -- register node
  moreglass.register_glass("glass_s" .. glass.dye, {
    description = glass.hue .. " Stained Glass",
    tiles = {"glass_s" .. glass.dye .. ".png", "glass_s" .. glass.dye .. "_detail.png"},
    use_texture_alpha = true,
    recipe = {
      output = "moreglass:glass_s" .. glass.dye,
      recipe = {
        {"moreglass:glass_molten", "moreglass:glass_molten", "moreglass:glass_molten"},
        {"moreglass:glass_molten", "dye:" .. glass.dye, "moreglass:glass_molten"},
        {"moreglass:glass_molten", "moreglass:glass_molten", "moreglass:glass_molten"}
      }
    }
  })
end

-- [loop] register stained glow glass
for i, glass in ipairs(GLASS_COLOURS) do
  -- register node
  moreglass.register_glass("glass_glow_s" .. glass.dye, {
    description = glass.hue .. " Opaque Glow Glass",
    tiles = {"glass_s" .. glass.dye .. ".png", "glass_s" .. glass.dye .. "_detail.png"},
    light_source = default.LIGHT_MAX-1,
    use_texture_alpha = true,
    recipe = {
      type = "shapeless",
      output = "moreglass:glass_glow_s" .. glass.dye,
      recipe = {"moreglass:glass_s" .. glass.dye, "moreglass:lightbulb"}
    }
  })
end

-- [loop] register clean stained glass
for i, glass in ipairs(GLASS_COLOURS) do
  -- register node
  moreglass.register_glass("glass_sc" .. glass.dye, {
    description = glass.hue .. " Clean Stained Glass",
    tiles = {"glass_s" .. glass.dye .. "_clean.png", "glass_s" .. glass.dye .. "_clean_detail.png"},
    use_texture_alpha = true,
    recipe = {
      type = "cooking",
      output = BASENAME..":glass_sc" .. glass.dye,
      recipe = BASENAME..":glass_s" .. glass.dye,
      cooktime = 5,
    }
  })
end

-- [loop] register clean stained glow glass
for i, glass in ipairs(GLASS_COLOURS) do
  -- register node
  moreglass.register_glass("glass_glow_sc" .. glass.dye, {
    description = glass.hue .. " Clean Stained Glow Glass",
    tiles = {"glass_s" .. glass.dye .. "_clean.png", "glass_s" .. glass.dye .. "_clean_detail.png"},
    light_source = default.LIGHT_MAX-1,
    use_texture_alpha = true,
    recipe = {
      type = "shapeless",
      output = "moreglass:glass_glow_sc" .. glass.dye,
      recipe = {"moreglass:glass_sc" .. glass.dye, "moreglass:lightbulb"},
    }
  })
end
