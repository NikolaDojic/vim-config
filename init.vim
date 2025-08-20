filetype plugin on
set number
set expandtab
set tabstop=2
set shiftwidth=2
set mouse=a
set clipboard=unnamedplus

let s:site_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(s:site_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.s:site_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  execute 'source' stdpath('config') . '/plugins.vim'
call plug#end()

for f in split(glob(stdpath('config') . '/config/*.vim'), '\n')
  execute 'source' f
endfor

if !exists('g:syntax_on')
  syntax enable
endif
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
