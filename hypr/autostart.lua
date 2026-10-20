-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- Como en mi Arch: al iniciar sesión, kitty con tmux en el espacio 1. Es la sesión
-- "Work", la misma a la que vuelve Super+Alt+Enter.
hl.on("hyprland.start", function()
  hl.exec_cmd(o.launch("xdg-terminal-exec tmux new-session -A -s Work"), { workspace = "1 silent" })
end)
