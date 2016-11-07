-- moreglass/api.lua
local BASENAME = moreglass.BASENAME -- basename pointer

function moreglass.register_glass(glass_string, desc)
  minetest.register_node(BASENAME..":"..glass_string, {
    description = desc.desc or desc.description,
  	drawtype = "glasslike_framed_optional",
  	tiles = desc.tiles or desc.textures,
  	paramtype = "light",
  	sunlight_propagates = true,
  	is_ground_content = false,
    use_texture_alpha = desc.use_texture_alpha or false,
    light_source = desc.light or desc.light_source or 0,
  	groups = desc.groups or { cracky = 3, oddly_breakable_by_hand = 3 },
  	sounds = desc.sounds or default.node_sound_glass_defaults(),
  })

  -- if recipe, register
  if desc.recipe then
    minetest.register_craft( desc.recipe )
  end
end

function moreglass.register_item(itemstring, desc)
  minetest.register_craftitem(BASENAME..":"..itemstring, {
    description = desc.desc or desc.description,
    inventory_image = desc.inventory_image or desc.inv_img,
    on_use = desc.on_use or {}
  })

  -- if recipe, register
  if desc.recipe then
    minetest.register_craft( desc.recipe )
  end
end
