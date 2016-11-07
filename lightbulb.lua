-- moreglass/lightbulb.lua
local BASENAME = moreglass.BASENAME

-- TUNGSTEN --

-- [OREBLOCK] tungsten
minetest.register_node(BASENAME..":mineral_tungsten", {
  description = "Tungsten Ore",
  tiles = { BASENAME.."_mineral_tungsten.png" },
  is_ground_content = true,
  drop = BASENAME..":lump_tungsten",
  groups = { cracky=3, stone=1 },
})
-- [ORE REGISTER] tungsten
minetest.register_ore({
  ore_type = "scatter",
  ore = BASENAME..":mineral_silver",
  wherein = "default:stone",
  clust_scarcity = 8*8*8,
  clust_num_ores = 4,
  clust_size = 3,
  y_min = -300,
  y_max = -90,
})

-- [NODE] tungsten
minetest.register_node(BASENAME..":block_tungsten", {
  description = "Tungsten Block",
  tiles = { BASENAME.."_block_tungsten.png" },
  is_ground_content = true,
  drop = BASENAME..":block_tungsten",
  groups = {cracky=3, stone="1"},
})

-- [item] tungsten lump
minetest.register_craftitem(BASENAME..":lump_tungsten", {
  description = "Tungsten Lump",
  inventory_image = BASENAME.."_lump_tungsten.png",
})

-- [item] tungsten ingot
minetest.register_craftitem(BASENAME..":ingot_tungsten", {
  description = "Tungsten Ingot",
  inventory_image = BASENAME.."_ingot_tungsten.png",
})

-- [recipe] Tungsten Ingot
minetest.register_craft({
  type = "cooking",
  output = BASENAME..":ingot_tungsten",
  recipe = BASENAME..":lump_tungsten",
  cooktime = 10,
})

-- [recipe] Tungsten Block
minetest.register_craft({
  output = BASENAME..":block_tungsten",
  recipe = {
    {BASENAME..":ingot_tungsten", BASENAME..":ingot_tungsten", BASENAME..":ingot_tungsten"},
    {BASENAME..":ingot_tungsten", BASENAME..":ingot_tungsten", BASENAME..":ingot_tungsten"},
    {BASENAME..":ingot_tungsten", BASENAME..":ingot_tungsten", BASENAME..":ingot_tungsten"},
  },
})

-- SILVER --

minetest.register_node(BASENAME..":mineral_silver", {
  description = "Silver Ore",
  tiles = { BASENAME.."_mineral_silver.png" },
  is_ground_content = true,
  drop = BASENAME..":lump_silver",
  groups = { cracky=3, stone=1 },
})
-- [ORE REGISTER] Silver
minetest.register_ore({
  ore_type = "scatter",
  ore = BASENAME..":mineral_silver",
  wherein = "default:stone",
  clust_scarcity = 8*8*8,
  clust_num_ores = 4,
  clust_size = 3,
  y_min = -200,
  y_max = -40,
})

-- [BLOCK] Silver
minetest.register_node(BASENAME..":block_silver", {
  description = "Silver Block",
  tiles = { BASENAME.."_block_silver.png" },
  is_ground_content = true,
  drop = BASENAME..":block_silver",
  groups = {cracky=3, stone="1"},
})

-- [item] silver lump
minetest.register_craftitem(BASENAME..":lump_silver", {
  description = "Silver Lump",
  inventory_image = BASENAME.."_lump_silver.png",
})

-- [item] silver ingot
minetest.register_craftitem(BASENAME..":ingot_silver", {
  description = "Silver Ingot",
  inventory_image = BASENAME.."_ingot_silver.png",
})

-- [item] Silver Wire
minetest.register_craftitem(BASENAME..":wire_silver", {
  description = "Silver Wire",
  inventory_image = BASENAME.."_wire_silver.png",
})

-- [recipe] Silver Ingot
minetest.register_craft({
  type = "cooking",
  output = BASENAME..":ingot_silver",
  recipe = BASENAME..":lump_silver",
  cooktime = 10,
})

-- [recipe] Silver Block
minetest.register_craft({
  output = BASENAME..":block_silver",
  recipe = {
    {BASENAME..":ingot_silver", BASENAME..":ingot_silver", BASENAME..":ingot_silver"},
    {BASENAME..":ingot_silver", BASENAME..":ingot_silver", BASENAME..":ingot_silver"},
    {BASENAME..":ingot_silver", BASENAME..":ingot_silver", BASENAME..":ingot_silver"},
  },
})

-- [recipe] silver wire
minetest.register_craft({
  type = "shapeless",
  output = BASENAME..":wire_silver 9",
  recipe = {BASENAME..":ingot_silver"},
})

-- ITEMS (wire, bulb) --

-- [item] Molten Glass
minetest.register_craftitem(BASENAME..":glass_molten", {
  description = "Molten Glass",
  inventory_image = BASENAME.."_glass_molten.png",
})

-- [item] Large Chunk of Molten Glass
minetest.register_craftitem(BASENAME..":glass_molten_large", {
  description = "Large Chunk of Molten Glass",
  inventory_image = BASENAME.."_glass_molten_large.png",
})

-- [item] Copper Wire
minetest.register_craftitem(BASENAME..":wire_copper", {
  description = "Copper Wire",
  inventory_image = BASENAME.."_wire_copper.png",
})

-- [item] Lightbulb Glass
minetest.register_craftitem(BASENAME..":lightbulb_glass", {
  description = "Lightbulb Glass",
  inventory_image = BASENAME.."_lightbulb_glass.png",
  use_texture_alpha = true,
})

-- [item] Lightbulb Filament
minetest.register_craftitem(BASENAME..":lightbulb_filament", {
  description = "Lightbulb Filament",
  inventory_image = BASENAME.."_lightbulb_filament.png",
})

-- [item] Lightbulb
minetest.register_craftitem(BASENAME..":lightbulb", {
  description = "Lightbulb",
  inventory_image = BASENAME.."_lightbulb.png",
  use_texture_alpha = true,
  light_source = LIGHT_MAX-1,
})

-- RECIPES --
-- Molten Glass
minetest.register_craft({
  type = "cooking",
  output = "genesis:glass_molten 9",
  recipe = "default:glass",
  cooktime = 5,
})

-- Large Chunk of Molten Glass
minetest.register_craft({
  output = "genesis:glass_molten_large",
  recipe = {
    {"genesis:glass_molten", "genesis:glass_molten", "genesis:glass_molten"},
    {"genesis:glass_molten", "genesis:glass_molten", "genesis:glass_molten"},
    {"genesis:glass_molten", "genesis:glass_molten", "genesis:glass_molten"},
  },
})

-- Lightbulb Glass
minetest.register_craft({
  output = BASENAME..":lightbulb_glass",
  recipe = {
    {"", BASENAME..":glass_molten", ""},
    {BASENAME..":glass_molten", "", BASENAME..":glass_molten"},
  },
})

-- Lightbulb Filament
minetest.register_craft({
  output = BASENAME..":lightbulb_filament",
  recipe = {
    {BASENAME..":wire_silver"},
    {BASENAME..":ingot_tungsten"},
  },
})

-- Lightbulb
minetest.register_craft({
  output = BASENAME..":lightbulb",
  recipe = {
    {BASENAME..":lightbulb_glass"},
    {BASENAME..":lightbulb_filament"},
    {BASENAME..":wire_copper"},
  },
})
