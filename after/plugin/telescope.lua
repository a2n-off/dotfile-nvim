local tlc = require('telescope')

-- telescope config
tlc.setup {
  defaults = {
    prompt_prefix = '$ '
  }
}

-- load plugin for telescope
tlc.load_extension('fzf')

