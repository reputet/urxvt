set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua << EOF
  require("which-key").setup {}
  require'lspconfig'.pyright.setup{}
  require'lspconfig'.clangd.setup{}
EOF

lua require'colorizer'.setup()
lua << EOF
require('nvim-autopairs').setup({
  enable_afterquote = false -- TODO: Does not work?
})
-- require("nvim-autopairs.completion.compe").setup({
--   map_cr = true, --  map <CR> on insert mode
--   map_complete = true -- it will auto insert `(` after select function or method item
-- })
EOF

lua require'hop'.setup()

lua <<EOF
  -- require'nvim-treesitter'.setup ()
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true
    },
    indent = {
      enable = true
    },
    rainbow = {
      enable = true,
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    }
  }
EOF

lua << EOF
    require('neoscroll').setup({
        use_local_scrolloff = true
    })
EOF

" lua << EOF
  " require("todo-comments").setup {
    " -- your configuration comes here
    " -- or leave it empty to use the default settings
    " -- refer to the configuration section below
  " }
" EOF

lua << EOF
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' or
    -- 'codicons' for codicon preset (requires vscode-codicons font installed)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = '',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})
EOF

lua << EOF
require'nvim-web-devicons'.setup {
    default = true;
}
EOF

lua << EOF
  require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" lua require('colorbuddy').colorscheme('gruvbuddy')
lua require'telescope'.load_extension('project')

" Add lua lsp
lua << EOF
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
-- local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
local sumneko_root_path = 'C:/Users/L/git/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
EOF
