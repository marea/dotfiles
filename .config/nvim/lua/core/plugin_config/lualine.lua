require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'nightly',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
