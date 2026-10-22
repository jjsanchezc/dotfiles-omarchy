-- Modo ahorro (power-saver, "Quiet" en ASUS): pantalla del portátil a 60 Hz y
-- sin animaciones (Omarchy ya trae el blur y las sombras apagados). Lee el perfil
-- activo al cargar; scripts/power-profile-watch recarga Hyprland cuando cambia.

local file = io.open("/sys/firmware/acpi/platform_profile", "r")
local profile = file and file:read("l")
if file then file:close() end

if profile == "quiet" then
  hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "0x0", scale = 1 })
  hl.config({ animations = { enabled = false } })
end
