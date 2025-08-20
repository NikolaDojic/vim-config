let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_settings = {
\    'html' : { 'indentation' : '\t' },
\    'javascript.jsx' : { 'extends': 'jsx', 'quote_char': "'" },
\    'javascript' : { 'extends' : 'jsx' },
\}

autocmd FileType eruby let g:user_emmet_settings = { 'eruby' : { 'extends' : 'html', 'quote_char': "'" } }
