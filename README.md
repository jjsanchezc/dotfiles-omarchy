# dotfiles-omarchy

Mi configuración de [Omarchy](https://omarchy.org/) (Arch + Hyprland) en un ASUS ROG Zephyrus G14.

Omarchy trae su configuración base en `/usr/share/omarchy` y la actualiza solo. Este repo guarda únicamente lo que cambié encima de esa base, en `~/.config`.

## Cómo está organizado

El repo es `~/.config` completo, con un `.gitignore` que **ignora todo por defecto** y habilita solo mis archivos con líneas `!`. Así nunca se suben datos privados (perfil del navegador, cookies, cachés). Para versionar un archivo nuevo hay que agregar su línea `!` al `.gitignore`.

`~/dotfiles` es un enlace a `~/.config`. No uso enlaces archivo por archivo porque Omarchy reescribe varios configs con `sed -i` o `mv`, y eso rompe los enlaces sin avisar.

## Qué hay aquí

### Escritorio

| Archivo | Para qué sirve | Mis cambios |
| --- | --- | --- |
| `hypr/hyprland.lua` | Archivo principal de Hyprland | Apaga los atajos de las apps preinstaladas que no uso |
| `hypr/bindings.lua` | Atajos de teclado | Ver [Atajos](#atajos) |
| `hypr/monitors.lua` | Pantallas | La pantalla HDMI va encima del portátil, centrada |
| `hypr/input.lua` | Teclado y touchpad | Alt derecho como tecla Compose (Alt der. + ' + e = é); scroll natural |
| `hypr/looknfeel.lua` | Apariencia | Separación fina: 3 px entre ventanas y 4 px al borde |
| `hypr/autostart.lua` | Programas al iniciar sesión | kitty con tmux (sesión "Work") en el espacio 1 |
| `omarchy/shell.json` | Barra superior | Menú, reloj y clima a la izquierda; espacios de trabajo al centro; CPU y RAM a la derecha; porcentaje de batería |
| `omarchy/shell.toml` | Tamaño del texto de la barra y menús | Lo ajusta `omarchy display text size` |
| `omarchy/extensions/omarchy-menu.jsonc` | Opciones del menú de Omarchy | Oculta Instalar → Gaming |
| `omarchy/plugins/jjsanchezc.menu` | Copia del menú de Omarchy | Ctrl + h/j/k/l para moverse, estilo vim |
| `omarchy/plugins/jjsanchezc.image-picker` | Copia del selector de fondos y temas | Ordena los temas por color |

### Terminal y programación

| Archivo | Para qué sirve | Mis cambios |
| --- | --- | --- |
| `kitty/kitty.conf`, `foot/foot.ini` | Terminales | Tamaño de letra |
| `tmux/tmux.conf` | tmux (prefijo: Ctrl + Espacio) | Plugins con TPM: resurrect, yank, vim-tmux-navigator y sensible; atajos de mi Arch (ver [Atajos](#atajos)) y sin Prefijo + k, que cerraba la ventana |
| `nvim/` | Neovim con LazyVim | Ver abajo |
| `mise/config.toml` | Herramientas de programación | Node, gh y Claude Code |
| `git/config` | Git | Nombre y correo para los commits |

### nvim

El resto de `nvim/` es la config de Omarchy, que hace que el tema de nvim siga al del sistema.

| Archivo | Qué hace |
| --- | --- |
| `lazyvim.json` | Extras: neo-tree, Docker, Git, JSON, LaTeX, Markdown, Python, SQL, TOML y YAML |
| `lua/config/options.lua` | Líneas largas sin partir (`wrap = false`) |
| `lua/config/keymaps.lua` | `jk` sale del modo insertar |
| `lua/plugins/blink.lua` | Tab acepta el autocompletado |
| `lua/plugins/cwd-first-keys.lua` | Minúscula = carpeta actual, mayúscula = raíz del proyecto |
| `lua/plugins/lint.lua` | Sin avisos de estilo en Markdown; shellcheck para `.sh` |
| `lua/plugins/obsidian.lua` | Notas de Obsidian; solo se activa si existe `~/Documents/obsidian/Master`, `cs` o `Personal` |
| `lua/plugins/vimtex.lua` | LaTeX con vista previa en zathura |
| `lua/plugins/vim-tmux-navigator.lua` | Ctrl + h/j/k/l entre ventanas de nvim y paneles de tmux |
| `lua/plugins/vim-be-good.lua` | Juego para practicar vim (`:VimBeGood`) |

## Atajos

Los demás atajos de Omarchy se ven con **Super + Shift + /**.

| Dónde | Atajo | Qué hace |
| --- | --- | --- |
| Escritorio | Super + Q | Cerrar la ventana |
| Escritorio | Super + W | Reiniciar la barra |
| Escritorio | Super + Shift + S | Captura de una región (se guarda y se copia) |
| Escritorio | Super + h / j / k / l | Pasar a la ventana de la izquierda / abajo / arriba / derecha |
| Escritorio | Super + Shift + h / j / k / l | Intercambiar la ventana con la de ese lado |
| Escritorio | Super + G | Abrir o cerrar la pantalla mágica (scratchpad) |
| Escritorio | Super + Shift + G | Mandar la ventana a la pantalla mágica |
| Escritorio | Super + S | Agrupar ventanas como pestañas |
| Escritorio | Super + E | Cambiar la división de la ventana |
| Escritorio | Super + Alt + L | Cambiar la distribución del espacio de trabajo |
| Escritorio | Super + Shift + / | Ver todos los atajos |
| Apps | Super + B | Navegador |
| Apps | Super + Shift + E | Explorador de archivos (Nautilus) |
| Apps | Super + Shift + A | Claude Code |
| Apps | Super + Alt + Enter | Terminal con tmux (vuelve a la sesión "Work") |
| Apps | Super + Shift + M | Spotify |
| Apps | Super + Shift + O | Obsidian |
| Apps | Super + Shift + D | Docker |
| Apps | Super + Shift + W | Omawrite |
| G14 | Fn + F5 | Siguiente perfil de ventilador |
| G14 | Tecla ROG | ROG Control Center |
| Menú de Omarchy | Ctrl + h / j / k / l | Atrás / bajar / subir / entrar |
| tmux | Prefijo, luego Ctrl + S / Ctrl + R | Guardar / restaurar sesiones |
| tmux | Prefijo, luego I | Instalar plugins |
| tmux | Prefijo, luego " / % | Dividir el panel (abajo / al lado) en la carpeta actual |
| tmux | Alt + h / l | Ventana anterior / siguiente |
| tmux | Alt + k / j | Sesión anterior / siguiente (dentro de nvim ya no mueven líneas) |
| tmux y nvim | Ctrl + h / j / k / l | Moverse entre paneles de tmux y ventanas de nvim |
| nvim | jk | Salir del modo insertar |
| nvim | Tab | Aceptar el autocompletado |

## Instalar en otra máquina

Requisito: Omarchy ya instalado. Como `~/.config` ya existe, el repo se descarga encima y mis archivos reemplazan los de Omarchy:

```bash
cd ~/.config
git init
git remote add origin git@github.com:jjsanchezc/dotfiles-omarchy.git
git fetch origin
git checkout -f -b main --track origin/main
ln -s ~/.config ~/dotfiles
```

Lo que no está en el repo y se descarga aparte:

```bash
# Gestor de plugins de tmux; luego, dentro de tmux: Prefijo + I
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Widget de CPU y RAM de la barra (plugin de terceros)
git clone https://github.com/andreireanu/omarchy-minimal-monitor.git \
  ~/.config/omarchy/plugins/io.github.andreireanu.minimal-monitor
```

Los plugins de nvim y sus herramientas (LSP, linters) se instalan solos la primera vez que se abre nvim.
