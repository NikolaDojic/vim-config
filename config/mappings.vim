nmap <M-(> ysiw)
vmap <M-(> S)
nmap <M-[> ysiw]
vmap <M-[> S
nmap <M-{> ysiw}
vmap <M-{> S
nmap <M-"> ysiw"
vmap <M-"> S"
nmap <M-'> ysiw'
vmap <M-'> S'

vmap <C-M-c> "+y
vnoremap <C-A-x> "+x
nnoremap <C-A-v> "+gp
inoremap <C-A-v> <Esc>"+gpa

nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

nmap <C-q> :ccl<CR>
nnoremap <C-W><C-F> <C-W>vgf

nnoremap + \\+
nnoremap - \\\-
set guifont=FantasqueSansMono\ NF:h14
set guioptions+=a
nnoremap <C-Up> :silent! let &guifont = substitute(&guifont,'\d\+','\=eval(submatch(0)+1)','')<CR><CR>
nnoremap <C-Down> :silent! let &guifont = substitute(&guifont,'\d\+','\=eval(submatch(0)-1)','')<CR><CR>

cnoreabbrev Ack Ack!<Space>
cnoreabbrev ack Ack!<Space>

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

nnoremap <leader>gc :GetCurrentBranchLink<cr>
vnoremap <leader>gc :GetCurrentBranchLink<cr>
