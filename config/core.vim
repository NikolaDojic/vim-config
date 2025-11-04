if has('termguicolors')
  set termguicolors
endif
colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

let g:ctrlp_working_path_mode = 'w'
autocmd BufEnter * :syntax sync fromstart

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
nnoremap <C-n> :NERDTreeToggle<CR>

" Improve YAML colors
augroup YamlColors
  autocmd!
  autocmd FileType yaml hi link yamlBlockMappingKey Identifier
  autocmd FileType yaml hi link yamlKeyValueDelimiter Delimiter
  autocmd FileType yaml hi link yamlBlockCollectionItemStart Special
  autocmd FileType yaml hi link yamlPlainScalar String
augroup END

lua require'colorizer'.setup()

lua << EOF
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "ruby", "embedded_template",
    "javascript", "tsx", "html", "css", "json", "yaml",
  },
  highlight = {
    enable = true,                               -- ← comma added here
    disable = { "tsx", "javascript" },           -- use vim-jsx-pretty instead
  },
})
EOF

