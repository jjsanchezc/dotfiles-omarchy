-- LaTeX: the tex extra (enabled in lazyvim.json) installs vimtex + texlab.
-- Here we only pick the PDF viewer: zathura if installed (best forward/inverse
-- search), otherwise the system default (Evince) via xdg-open.
-- zathura_simple because plain "zathura" needs xdotool, which can't see
-- Wayland windows.
return {
  {
    "lervag/vimtex",
    init = function()
      if vim.fn.executable("zathura") == 1 then
        vim.g.vimtex_view_method = "zathura_simple"
      else
        vim.g.vimtex_view_method = "general"
      end
    end,
  },
}
