#!/bin/bash

# Print theme names light first, then by accent hue with grays last, so the
# theme picker can show similar palettes side by side.

user_themes="$HOME/.config/omarchy/themes"
omarchy_themes="${OMARCHY_PATH:-/usr/share/omarchy}/themes"

# Themes whose accent has some color but that look gray/black overall.
force_gray=" last-horizon "

# Themes whose accent doesn't match how they look: sort them by this hue instead.
declare -A hue_override=(
  [gruvbox]=30   # warm brown, next to ristretto and matte-black
  [retro-82]=200 # navy, next to lumon
  [kanagawa]=218 # dark indigo, next to catppuccin
)

sort_key() {
  awk '
    function hex(c) { return index("0123456789abcdef", tolower(c)) - 1 }
    function byte(s, i) { return (hex(substr(s, i, 1)) * 16 + hex(substr(s, i + 1, 1))) / 255 }
    BEGIN { accent = "808080" }
    /^mode[[:space:]]*=/ { light = ($0 ~ /"light"/) }
    /^accent[[:space:]]*=/ { gsub(/.*"#|".*/, ""); accent = $0 }
    END {
      r = byte(accent, 1); g = byte(accent, 3); b = byte(accent, 5)
      max = r; if (g > max) max = g; if (b > max) max = b
      min = r; if (g < min) min = g; if (b < min) min = b
      d = max - min; l = (max + min) / 2; a = 2 * l - 1; if (a < 0) a = -a
      s = (d == 0 || a == 1) ? 0 : d / (1 - a)
      if (d == 0) h = 0
      else if (max == r) { h = 60 * ((g - b) / d); if (h < 0) h += 360 }
      else if (max == g) h = 60 * ((b - r) / d + 2)
      else h = 60 * ((r - g) / d + 4)
      printf "%d%d%03d", light ? 0 : 1, s < 0.15 ? 1 : 0, h
    }
  ' "$1"
}

declare -A seen
for theme in "$user_themes"/*/ "$omarchy_themes"/*/; do
  [[ -d $theme ]] || continue
  name=$(basename "$theme")
  [[ -n ${seen[$name]} ]] && continue
  seen[$name]=1

  colors=""
  for candidate in "$user_themes/$name/colors.toml" "$omarchy_themes/$name/colors.toml"; do
    [[ -f $candidate ]] && { colors=$candidate; break; }
  done

  if [[ -n $colors ]]; then
    key=$(sort_key "$colors")
    [[ $force_gray == *" $name "* ]] && key="${key:0:1}1${key:2}"
    [[ -n ${hue_override[$name]} ]] && key="${key:0:2}$(printf '%03d' "${hue_override[$name]}")"
    printf '%s\t%s\n' "$key" "$name"
  else
    printf '9\t%s\n' "$name"
  fi
done | sort | cut -f2
