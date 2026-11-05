-- Espacios de trabajo compartidos entre monitores, como antes de Omarchy 4.5:
-- el espacio 1 es el mismo para todas las pantallas y Super+1 va a él, esté en
-- el monitor que esté.
--
-- Omarchy 4.5 da a cada monitor sus propios 1-10 (el portátil 1-10, el
-- siguiente 11-20...) en default/hypr/monitor-workspaces.lua, sin opción para
-- apagarlo. Aquí se reemplazan sus funciones por las normales de Hyprland. Como
-- ya nada escribe ~/.local/state/omarchy/monitor-workspaces, la barra muestra
-- los mismos espacios en todas las pantallas.

local ws = o.workspaces

-- No reacomodar los espacios al iniciar, recargar o conectar monitores.
ws.reconcile = function() end

ws.workspace_id = function(_, slot)
  return slot
end

-- La barra también los usa: al hacer clic llama a o.workspaces.focus(n, monitor).
ws.focus = function(slot)
  return hl.dsp.focus({ workspace = tostring(slot) })
end

ws.move_window = function(slot, follow)
  return hl.dsp.window.move({ workspace = tostring(slot), follow = follow ~= false })
end

ws.move_to_monitor = function(direction)
  return function()
    local target = hl.get_monitor(direction)
    if target then
      hl.dispatch(hl.dsp.workspace.move({ monitor = target.name }))
    end
  end
end

-- Los atajos de Omarchy ya quedaron armados con sus funciones; se rehacen.
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  o.rebind("SUPER + " .. key, "Switch to workspace " .. workspace, ws.focus(workspace))
  o.rebind("SUPER + SHIFT + " .. key, "Move window to workspace " .. workspace, ws.move_window(workspace))
  o.rebind("SUPER + SHIFT + ALT + " .. key, "Move window silently to workspace " .. workspace, ws.move_window(workspace, false))
end

for _, d in ipairs({ { "LEFT", "l", "left" }, { "RIGHT", "r", "right" }, { "UP", "u", "up" }, { "DOWN", "d", "down" } }) do
  o.rebind("SUPER + SHIFT + ALT + " .. d[1], "Move workspace to " .. d[3] .. " monitor", ws.move_to_monitor(d[2]))
end
