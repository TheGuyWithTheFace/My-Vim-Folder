" Enable awesome stuff
set nocompatible

" Enable woring with vim-related packages in debian
runtime! debian.vim

" Enable Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Making vim look good (plugins)
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'

" File views
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Syntax highlighting
Plugin 'scrooloss/syntastic'

" Tags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

" File finder
Plugin 'kien/ctrlp.vim'

" Alternate.vim
Plugin 'vim-scripts/a.vim'

" Working with git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Other editing features
Plugin 'Raimondi/delimitMate'

" Man pages, tmux
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" Highlight-remove trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'

" HTML closing tag
Plugin 'HTML-AutoCloseTag'

call vundle#end()

filetype plugin indent on
" End Vundle Stuff

" General settings
set number			" Show line numbers
set ruler			" Show cursor position always
set backspace=indent,eol,start
set showcmd			" Show command in status line
set incsearch			" Do incremental searching
set hlsearch
set showmatch 			" Show matching brackets

" Enable syntax highlighting
syntax enable

" set tabs and auto indenting
set ts=4
filetype indent on
set autoindent
set shiftwidth=4
set softtabstop=4
set expandtab


" Enable mouse use
set mouse=a

" Make vim pretty
set t_Co=256
set background=dark
colorscheme solarized

" Plugin settings

"-------vim-airline--------
set laststatus=2

"Fancy arrow symbols
let g:airline_powerline_fonts=1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled=1

"------nerdTree stuff-------
"Open/close tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" TO have NERDtree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0

"------ syntastic settings -----
let g:syntastic_error_symbol="✘"
let g:syntastic_warning_symbol="▲"
augroup mySyntastic
	au!
	au FileType text let b:syntastic_mode = "passive"
augroup END

"-------easy tags settings -----
" Where to look for for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

"-------- TagBar settings ------
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

"------- airblade/vim-gitgutter settings -------
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

"-------DelimitMate settings------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
	au!
	au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
	au FileType tex let b:delimitMate_quotes = ""
	au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
	au FileType python let b:delimitmate_nesting_quotes = ['"', "'"]
augroup END

"-------superman settings
" k shortcut
noremap K :SuperMan <cword><CR>

"--- Open last location when reopening a previously-edited file.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


