colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

let g:ctrlp_working_path_mode = 'w'

autocmd BufEnter * :syntax sync fromstart

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
nnoremap <C-n> :NERDTreeToggle<CR>

lua require'colorizer'.setup()

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "ruby", "embedded_template",
    "javascript", "tsx", "html", "css", "json", "yaml"
  },
  highlight = { 
    enable = true 
    disable = { "tsx", "javascript" },  -- use vim-jsx-pretty instead
  }
}
EOF
