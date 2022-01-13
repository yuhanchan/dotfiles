set nu rnu
set cursorline
set wrap
" set hlsearch
set tabstop=4
set softtabstop=4
set showcmd
set ts=4 sw=4
set wildmenu
set showmatch
set incsearch
set splitbelow
if has('termsize')
	set termsize=10x0 
else
	set termwinsize=10x0
end
set splitright
filetype indent on
syntax on

" let mapleader = '-'
" leader
let g:rainbow_active=1

" this is to solve the issue where Alt is perceived as escape by terminal
execute "set <M-j>=\ej"
nnoremap <M-j> j
execute "set <M-k>=\ek"
nnoremap <M-k> k

" remaps
noremap <C-n> :NERDTreeToggle<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <F3> :set hlsearch!<cr>
nnoremap vter :vertical terminal<cr>
nnoremap ter :terminal<cr>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <esc><esc> :noh<return><esc>
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap U <C-R>

inoremap jk <esc>
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi

vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

onoremap p i(

" move cursor in insert mode
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-w> <esc>wi
inoremap <C-b> <esc>bi

" to change habit
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" typo fix
iabbrev waht what
iabbrev tehn then

" statusline
set laststatus=2
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines


"$$$$$$$$$$$$$$$$$$$$ Vim Plug Start $$$$$$$$$$$$$$$$$$$
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'
" Plug 'valloric/youcompleteme'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline-themes'
Plug 'hardcoreplayers/oceanic-material'
Plug 'frazrepo/vim-rainbow'
" Shorthand notation; fetcvhes https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips'

" On-demand loading
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install } }

call plug#end()
"$$$$$$$$$$$$$$$$$$$$  Vim Plug End  $$$$$$$$$$$$$$$$$$$

"$$$$$$$$$$$$$$$$$$$$ Plugin Configs $$$$$$$$$$$$$$$$$$$
autocmd StdinReadPre * let s:std_in=1
" open NERDTree if no file specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
" open NERDTree if dest is a folder
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" close window when the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" :autocmd InsertEnter,InsertLeave * set cul!

"$$$$$$$$$$$$$$$$$$$ Color Scheme $$$$$$$$$$$$$$$$$$$$$$
set background=dark
let g:gruvbox_contrast_dark="medium"
colorscheme gruvbox
" let g:sonokai_style = 'maia'

" for NERDCommenter
map <C-p> <plug>NERDCommenterToggle
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" for indent
nnoremap <Tab> v>
nnoremap <S-Tab> v<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
