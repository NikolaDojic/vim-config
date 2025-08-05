filetype plugin on
set tabstop=2
set shiftwidth=2
set number
set expandtab
set mouse=a
set clipboard=unnamedplus

" install vim-plug, if needed
let site_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(site_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.site_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

call plug#begin()
  "neerdtree
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  
  "themes and highlighting
  Plug 'crusoexia/vim-monokai' " copy color to ~/.config/nvim/colors
  Plug 'crusoexia/vim-javascript-lib'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'styled-components/vim-styled-components'

  " search
  Plug 'mileszs/ack.vim'
  Plug 'tpope/vim-abolish'
  Plug 'ctrlpvim/ctrlp.vim'

  " html, css
  Plug 'mattn/emmet-vim'
  Plug 'csscomb/vim-csscomb'
  Plug 'norcalli/nvim-colorizer.lua'

  " utils
  Plug 'zivyangll/git-blame.vim'
  Plug 'knsh14/vim-github-link'
  Plug 'tpope/vim-surround'
  Plug 'fvictorio/vim-extract-variable'
  Plug 'tomtom/tcomment_vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " language server, formating, linting
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-snippets' " because there was an issue installing with CocInstall
  Plug 'honza/vim-snippets'

  " README preview 
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
  
  " orgmode
  Plug 'jceb/vim-orgmode'
    " CocInstall
call plug#end()

let g:coc_global_extensions = [
       \'coc-tsserver',
       \'coc-prettier',
       \'coc-json',
       \'coc-eslint',
       \'coc-snippets',
       \'coc-styled-components'
       \]

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" open definition in vertical split
nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>

" rename 
nmap <leader>rn <Plug>(coc-rename)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Organize imports and run Prettier
nmap <C-S-o> :call OrganizeImportsAndFormat()<CR>

function! OrganizeImportsAndFormat()
  call CocAction('runCommand', 'editor.action.organizeImport')
  call CocAction('runCommand', 'prettier.formatFile')
endfunction

if !exists('g:syntax_on')
	syntax enable
endif
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

" nerdtree
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
nnoremap <C-n> :NERDTreeToggle<CR>

" vim-surround custom mappings
nmap <M-(> ysiw) 
vmap <M-(> S) 
nmap <M-[> ysiw] 
vmap <M-[> S] 
nmap <M-{> ysiw} 
vmap <M-{> S} 
nmap <M-"> ysiw" 
vmap <M-"> S" 
nmap <M-'> ysiw' 
vmap <M-'> S' 

" utils
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
" opens file under cursor in vertical split
nnoremap <C-W><C-F> <C-W>vgf 

" emmet
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_settings = {
\    'html' : {
\    	'indentation' : '	'
\    },
\    'javascript.jsx' : {
\      'extends': 'jsx',
\			 'quote_char': "'",
\  },  
\		'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" font, font resize
nnoremap + \\+
nnoremap - \\\\-
nnoremap <C-Up> :silent! let &guifont = substitute(
 \ &guifont,
 \ '\d\+',
 \ '\=eval(submatch(0)+1)',
 \ '')<CR><CR>
nnoremap <C-Down> :silent! let &guifont = substitute(
 \ &guifont,
 \ '\d\+',
 \ '\=eval(submatch(0)-1)',
 \ '')<CR><CR>
set guifont=FantasqueSansMono\ NF:h14
set guioptions+=a

" git-blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
nmap <C-s> <Plug>MarkdownPreviewToggle
   
" ack
cnoreabbrev Ack Ack!<Space>
cnoreabbrev ack Ack!<Space>

" extract variable
" nnoremap <leader>v :call <sid>ExtractToVariable('')<cr>
" vnoremap <leader>v :<c-u>call <sid>ExtractToVariable(visualmode())<cr>

" git copy line link
nnoremap <leader>gc :GetCurrentBranchLink<cr>
vnoremap <leader>gc :GetCurrentBranchLink<cr>
 
" snippets
autocmd FileType javascript inoremap <C-f> <Space>=> ({<Esc>o})<Esc>O
autocmd FileType javascript nmap gl Biconsole.log(<Esc>Ea)<Esc>

" auto format
autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb

" syntax highlighting fix for styled components
autocmd BufEnter * :syntax sync fromstart

" coc
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" autocmd CursorHold * silent call CocActionAsync('doHover') " show popup info from language server automatically after 0.5s
nmap <silent> <leader>h :call CocActionAsync('doHover')<CR>
" set updatetime=500  " popup delay time



let g:ctrlp_working_path_mode = 'w'

lua require'colorizer'.setup()

