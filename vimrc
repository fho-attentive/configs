" :autocmd FileType python noremap <C-l> :!/usr/bin/python %<CR>
set expandtab
set nu
set background=dark
set shiftwidth=4
set tabstop=4
set smarttab
set ai
set si
set wrap
set hlsearch
set paste
syntax on
set smartcase
set ignorecase
set smartindent
set autoindent
set ruler

set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
:autocmd FileType python noremap <C-n> :!python %<CR>
set expandtab

vmap <C-o> :w !python<CR>
vmap <C-k> :w !ruby<CR>

function! s:NavigateTermSplits(direction)
  let windowNumber = winnr()
  execute 'wincmd ' . a:direction
  if windowNumber == winnr()
    " We didn't move to a new vim split. Now try to move tmux splits
    silent call system('tmux select-pane -' . tr(a:direction, 'hjkl', 'LDUR'))
  endif
endfunction

nnoremap <silent> <C-h> :call <SID>NavigateTermSplits('h')<CR>
nnoremap <silent> <C-j> :call <SID>NavigateTermSplits('j')<CR>
nnoremap <silent> <C-k> :call <SID>NavigateTermSplits('k')<CR>
nnoremap <silent> <C-l> :call <SID>NavigateTermSplits('l')<CR>

au BufRead /tmp/psql.edit.* set syntax=sql
