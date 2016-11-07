-- moreglass/init.lua
moreglass = {}
moreglass.BASENAME = "moreglass"
moreglass.modpath = minetest.get_modpath(moreglass.BASENAME)
local modpath = moreglass.modpath -- modpath pointer

dofile(modpath.."/api.lua") -- run api
dofile(modpath.."/glass.lua") -- load glass

if not minetest.get_modpath("morelights") then
  dofile(modpath.."/lightbulb.lua") -- load lightbulb & depends
  moreglass.LIGHTMOD = moreglass.BASENAME -- set light modname
else moreglass.LIGHTMOD = "morelights" end -- else, use morelights light bulb

--[[ Index of Glass Nodes:
OTHER NODES:
  :default:glass                  (OVERRIDE)
  moreglass:glass_glow
  moreglass:glass_clean
  moreglass:glass_glowc

OPAQUE NODES:
  moreglass:glass_oblack          (Black)
  moreglass:glass_oblue           (Blue)
  moreglass:glass_obrown          (Brown)
  moreglass:glass_ocyan           (Cyan)
  moreglass:glass_ogreen          (Green)
  moreglass:glass_omagenta        (Magenta)
  moreglass:glass_oorange         (Orange)
  moreglass:glass_opink           (Pink)
  moreglass:glass_ored            (Red)
  moreglass:glass_oviolet         (Violet)
  moreglass:glass_oyellow         (Yellow)
  moreglass:glass_owhite          (White)

OPAQUE GLASS LANTERN NODES:
  moreglass:glass_glow_oblack      (Black Glass Glow)
  moreglass:glass_glow_oblue      (Blue Glass Glow)
  moreglass:glass_glow_obrown      (Brown Glass Glow)
  moreglass:glass_glow_ocyan      (Cyan Glass Glow)
  moreglass:glass_glow_ogreen      (Green Glass Glow)
  moreglass:glass_glow_omagenta      (Magenta Glass Glow)
  moreglass:glass_glow_oorange      (Orange Glass Glow)
  moreglass:glass_glow_opink      (Pink Glass Glow)
  moreglass:glass_glow_ored      (Red Glass Glow)
  moreglass:glass_glow_oviolet     (Violet Glass Glow)
  moreglass:glass_glow_oyellow     (Yellow Glass Glow)
  moreglass:glass_glow_owhite     (White Glass Glow)

STAINED GLASS NODES:
  moreglass:glass_sblack             (Black)
  moreglass:glass_sblue             (Blue)
  moreglass:glass_sbrown             (Brown)
  moreglass:glass_scyan             (Cyan)
  moreglass:glass_sgreen             (Green)
  moreglass:glass_smagenta             (Magenta)
  moreglass:glass_sorange             (Orange)
  moreglass:glass_spink             (Pink)
  moreglass:glass_sred             (Red)
  moreglass:glass_sviolet            (violet)
  moreglass:glass_syellow            (Yellow)
  moreglass:glass_swhite            (White)

  STAINED GLASS LANTERN NODES:
    moreglass:glass_glow_sblack   (Black)
    moreglass:glass_glow_sblue   (Blue)
    moreglass:glass_glow_sbrown   (Brown)
    moreglass:glass_glow_scyan   (Cyan)
    moreglass:glass_glow_sgreen   (Green)
    moreglass:glass_glow_smagenta   (Magenta)
    moreglass:glass_glow_sorange   (Orange)
    moreglass:glass_glow_spink   (Pink)
    moreglass:glass_glow_sred   (Red)
    moreglass:glass_glow_sviolet  (violet)
    moreglass:glass_glow_syellow  (Yellow)
    moreglass:glass_glow_swhite  (White)]]
