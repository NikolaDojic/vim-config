autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :CSScomb

autocmd FileType javascript inoremap <C-f> <Space>=> ({<Esc>o})<Esc>O
autocmd FileType javascript nmap gl Biconsole.log(<Esc>Ea)<Esc>
