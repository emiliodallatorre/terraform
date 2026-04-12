set backspace=indent,eol,start
set encoding=utf-8
set number

call plug#begin()

" Dart development
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'

Plug 'preservim/nerdtree'
Plug 'preservim/vim-markdown'

Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'chrisbra/csv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'dense-analysis/ale'
Plug 'lervag/vimtex'

" CC writing & formatting
Plug 'rhysd/vim-clang-format'

call plug#end()

inoremap <C-S> <Esc>:Autoformat<CR>:w<CR>i
nnoremap <C-S> :Autoformat<CR>:w<CR>


" Generic format: reindent entire file using gg=G
function! FormatGeneric()
	normal! gg=G
endfunction

" Format with clang-format for supported filetypes
function! FormatSpecific()
	if &filetype =~# 'c\|cpp\|objc'
		execute "ClangFormat"
	else
		call FormatGeneric()
	endif
endfunction

execute "set <C-M-l>=\<Esc>\<C-l>"
" Map in normal mode
nnoremap <C-M-l> :call FormatSpecific()<CR>
" Map in insert mode
inoremap <C-M-l> <C-o>:call FormatSpecific()<CR>


" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

syntax on

" Mouse & cursor
set mouse=a
if has("autocmd")
	au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
	au InsertEnter,InsertChange *
				\ if v:insertmode == 'i' | 
				\   silent execute '!echo -ne "\e[6 q"' | redraw! |
				\ elseif v:insertmode == 'r' |
				\   silent execute '!echo -ne "\e[4 q"' | redraw! |
				\ endif
	au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"execute "set <C-M-c>=\<Esc>\<C-c>"
"execute "set <C-M-v>=\<Esc>\<C-v>"

" Copy selected text in visual mode to system clipboard
"wq
"vnoremap <C-M-c> "+y
" Paste from system clipboard in normal mode with Ctrl+Alt+V
"nnoremap <C-M-v> "+p
" Paste in insert mode with Ctrl+Alt+V
"inoremap <C-M-v> <C-r>+

