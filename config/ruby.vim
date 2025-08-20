autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

nnoremap <leader>ra :A<CR>
nnoremap <leader>rr :R <Space>

let test#strategy = 'neovim'
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>

let g:ale_linters = { 'ruby': ['rubocop'] }
let g:ale_fixers  = { 'ruby': ['rubocop'] }
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

nnoremap <leader>rf :ALEFix<CR>
nnoremap <leader>rl :ALENextWrap<CR>
nnoremap <leader>rL :ALEPreviousWrap<CR>
