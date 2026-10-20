return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
        sh = { "shellcheck" },
      },
    },
  },
  -- shellcheck no está instalado en el sistema; Mason lo instala para nvim.
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "shellcheck" } },
  },
}
