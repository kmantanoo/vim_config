call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
call plug#end()

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Map Ctrl-Backspace to delete the previous word in insert mode.
inoremap <C-BS> <C-W>

let g:deoplete#enable_at_startup = 1
set number
set shiftwidth=4
set softtabstop=4


" NERDTree autocmd
" Start NERDTree. If a file is specfified, move the cursor to its windows.
autocmd StdinReadPre * let s:std_in=1
" has argument list
:if argc() > 0 && !exists('s:std_in')
:   if isdirectory(argv()[0])
	autocmd VimEnter * execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0]
:   else
	autocmd VimEnter * let s:dirname = fnamemodify(argv()[0], ':p:h')
	autocmd VimEnter * execute 'NERDTree' s:dirname | wincmd p | execute 'cd '.s:dirname
:   endif
" no argument list
:else
    autocmd VimEnter * execute 'NERDTree' getcwd() | wincmd p | enew
:endif


" Exit Vim if NERDTree is the only windows left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
