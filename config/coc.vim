let g:coc_global_extensions = [
\ 'coc-tsserver',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-eslint',
\ 'coc-snippets',
\ 'coc-styled-components',
\ 'coc-solargraph'
\ ]

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>x  <Plug>(coc-convert-snippet)

nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <silent> <leader>h :call CocActionAsync('doHover')<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nmap <C-S-o> :call OrganizeImportsAndFormat()<CR>
function! OrganizeImportsAndFormat()
  call CocAction('runCommand', 'editor.action.organizeImport')
  call CocAction('runCommand', 'prettier.formatFile')
endfunction
