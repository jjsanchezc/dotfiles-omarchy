-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Atajos de apps preinstaladas que sí uso. Los demás están apagados con
-- omarchy_preinstalled_bindings = false en hyprland.lua.
o.bind("SUPER + SHIFT + A", "Claude Code", "omarchy-agent")
o.bind("SUPER + ALT + RETURN", "Tmux", { omarchy = "terminal-tmux" })
o.bind("SUPER + SHIFT + M", "Music", { omarchy = "spotify" })
o.bind("SUPER + SHIFT + D", "Docker", { tui = "omarchy-launch-docker-tui" })
o.bind("SUPER + SHIFT + O", "Obsidian", { launch = "obsidian", focus = "^obsidian$" })
o.bind("SUPER + SHIFT + W", "Omawrite", { launch = "omawrite" })

-- Navegador con Super+B (además de Super+Shift+B que trae Omarchy).
o.bind("SUPER + B", "Browser", { omarchy = "browser" })

-- Explorador de archivos con Super+Shift+E (además de Super+Shift+F que trae Omarchy).
o.bind("SUPER + SHIFT + E", "File manager", { omarchy = "nautilus" })

-- Pantalla mágica (scratchpad) en Super+G como en mi Arch; la agrupación pasa a Super+S.
hl.unbind("SUPER + G") -- era Toggle window grouping
hl.unbind("SUPER + S") -- era Toggle scratchpad
o.bind("SUPER + G", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
o.bind("SUPER + SHIFT + G", "Move window to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))
o.bind("SUPER + S", "Toggle window grouping", hl.dsp.group.toggle())

-- Como en mi Arch: Super+Q cierra, Super+W reinicia la barra, Super+Shift+S captura una región.
hl.unbind("SUPER + W") -- era Close window
o.bind("SUPER + Q", "Close window", hl.dsp.window.close())
o.bind("SUPER + W", "Restart bar", "omarchy-restart-shell")
o.bind("SUPER + SHIFT + S", "Screenshot region", "omarchy-capture-screenshot region")

-- Herdr está desinstalado (este atajo no depende de la opción de arriba).
hl.unbind("SUPER + CTRL + K")

-- Moverse entre ventanas con hjkl (estilo vim) en vez de flechas.
-- Super+hjkl cambia el foco y Super+Shift+hjkl intercambia la ventana.
local vim = {
  { key = "H", arrow = "LEFT", dir = "l", name = "left" },
  { key = "J", arrow = "DOWN", dir = "d", name = "down" },
  { key = "K", arrow = "UP", dir = "u", name = "up" },
  { key = "L", arrow = "RIGHT", dir = "r", name = "right" },
}
hl.unbind("SUPER + J") -- era Toggle window split
hl.unbind("SUPER + K") -- era Keybindings
hl.unbind("SUPER + L") -- era Toggle workspace layout
for _, m in ipairs(vim) do
  hl.unbind("SUPER + " .. m.arrow)
  hl.unbind("SUPER + SHIFT + " .. m.arrow)
  o.bind("SUPER + " .. m.key, "Focus " .. m.name, hl.dsp.focus({ direction = m.dir }))
  o.bind("SUPER + SHIFT + " .. m.key, "Swap window " .. m.name, hl.dsp.window.swap({ direction = m.dir }))
end

-- Lo que estaba en Super+J, K y L.
o.bind("SUPER + SHIFT + SLASH", "Keybindings", "omarchy-menu-keybindings")
o.bind("SUPER + E", "Toggle window split", hl.dsp.layout("togglesplit"))
o.bind("SUPER + ALT + L", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")

-- Teclas ASUS del G14: Fn+F5 cambia el perfil (ventilador) y la tecla ROG abre ROG Control Center.
o.bind("XF86Launch4", "Perfil ASUS siguiente", [[asusctl profile next && omarchy-notification-send -u low "$(asusctl profile get | sed -n 's/^Active profile: /Perfil: /p')"]])
o.bind("XF86Launch1", "ROG Control Center", { launch = "rog-control-center" })

-- OmaControl (plugin de configuración) con Super+I, como "Configuración" en Windows.
o.bind("SUPER + I", "OmaControl", "omarchy-shell omacontrol toggle")
