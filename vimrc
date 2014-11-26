" vim:fdm=marker
" .vimrc
" v.0.2.0 - 28.10.2014 by Florenz Heldermann
" Based on the beginners vimrc by Philip Trasher
" 

set nocompatible " Fuck VI... That's for grandpas.
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" VUNDLE PLUGINs"{{{

" Let vundle manage itself:
Bundle 'gmarik/vundle'

" Just a shitload of color schemes.
" https://github.com/flazz/vim-colorschemes#current-colorschemes
Bundle 'flazz/vim-colorschemes'

" Fuzzy finder -- absolutely must have.
" no, not anymore, unite ftw
" Bundle 'kien/ctrlp.vim'

" Support for easily toggling comments.
Bundle 'tpope/vim-commentary'
" better html indenting
Bundle 'indenthtml.vim'  
" Syntax Plugins 

Bundle 'pangloss/vim-javascript' 
Bundle 'tpope/vim-markdown' 
Bundle 'groenewege/vim-less' 
Bundle 'JulesWang/css.vim' 
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'kchmck/vim-coffee-script' 
" Bundle 'leshill/vim-json' 
Bundle 'elzr/vim-json'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'Shougo/unite.vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose' 

Plugin 'moll/vim-bbye'

" Powerline
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat' 

Plugin 'scrooloose/syntastic'
Plugin 'edkolev/tmuxline.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'boucherm/ShowMotion'

"}}}
call vundle#end()            " required
" GLOBAL SETTINGS (sets)"{{{
" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.
set number

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set backspace=2

" comment so that the whitespace works >.> "
set breakindent
set showbreak=..

" MacVim FontSize
set gfn=Monaco:h14

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block
set linespace=10 
"}}}
" SHORTCUTS"{{{
" the godlike leader key
let mapleader = ","

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" Quick Split View Sizing
nnoremap <silent> <Leader>+ :vertical resize +10<CR>
nnoremap <silent> <Leader>- :vertical resize -10<CR>

" inc / dec value
nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>

" Circling buffers
nnoremap <leader>m :bnext<CR>
nnoremap <leader>n :bprevious<CR>

" Close Buffer, but not window with vim-bbye
" maps it to leader-q" maps it to leader-q
nnoremap <Leader>q :Bdelete<CR>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" because of clumsy fingers and too fast typing, this is life-saving (for me)
" command WQ wq
" command Wq wq
" command W w
" command Q q

" bindings for easy split nav {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
map <leader>w <C-w>v<C-w>l
map <C-t> <esc>:tabnew<CR>
" }}}

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Quick Word replacement - see: http://vimrcfu.com/snippet/30 
nnoremap <leader>r :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <leader>R :%s/\<<C-r>=expand('<cword>')<CR>\>/'

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>


"}}}
" NEOCOMPLETE {{{
let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#sources#dictionary#dictionaries = {
"             \ 'default' : '',
"             \ 'vimshell' : $HOME.'/.vimshell_hist'
"             \ }

" if !exists('g:neocomplete#sources')
"     let g:neocomplete#sources = {}
" endif

" if !exists('g:neocomplete#sources#omni#input_patterns')
"     let g:neocomplete#sources#omni#input_patterns = {}
" endif

" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" let g:neocomplete#sources#omni#input_patterns.cs = '.*[^=\);]'
" let g:neocomplete#sources.cs = ['omni']
" let g:neocomplete#enable_refresh_always = 0
" let g:echodoc_enable_at_startup = 1
" let g:neocomplete#enable_insert_char_pre = 1
" }}}
" AIRLINE"{{{

" Vim Airline on single view
set laststatus=2

" Automatically displays all buffers when theres only one tab open
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_theme')
    let g:airline_theme = 'wombat'
endif
let g:airline_powerline_fonts=1
if !exists('g:airline_powerline_fonts')
    let g:airline_left_sep='â€º'
    let g:airline_right_sep='â€¹'
endif"
"}}}
" iTerm2"{{{

" Change Cursor in insert Mode
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.  noremap j gj
noremap k gk

"}}}
" VIM-COMMENTARY:"{{{

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

"}}}
" CTRL-P"{{{

" Let ctrlp have up to 30 results.
" let g:ctrlp_max_height = 30

"}}}
" EASYMOTION {{{

" set em prefix
map <Leader>p <Plug>(easymotion-prefix)


"}}}
" EMMET"{{{

" Remap the key to TAB
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"}}}
" NERDTREE "{{{

" Open Nerdtree on Startup if no file is open
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Map :NERDTreeToggle to CTRL + T
map <leader>e :NERDTreeToggle<CR>
map <C-e> :NERDTreeToggle<CR>

"close vim if nerdtree is the last remaining window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"}}}
" VIM-REPEAT"{{{

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"}}}
" FOLDING "{{{
set fdm=indent
set fdc=4
set fdl=1

" Folding: Toggle with F9 
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Folding: Toggle with SPACE (in normal mode)
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Folding: Filetype Settings
autocmd BufRead,BufEnter *.css setlocal foldmethod=marker
autocmd BufRead,BufEnter *.scss setlocal foldmethod=marker
autocmd BufRead,BufEnter .vimrc setlocal foldmethod=marker


" autosaves and loads folding info
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

"}}}
" SHOWMOTION

"Show motion for words:  
" nnoremap <silent> w w:call g:Highw()<CR>:call g:HighW()<CR>  
" nnoremap <silent> W W:call g:Highw()<CR>:call g:HighW()<CR>  
" nnoremap <silent> b b:call g:Highb()<CR>:call g:HighB()<CR>  
" nnoremap <silent> B B:call g:Highb()<CR>:call g:HighB()<CR>  
" nnoremap <silent> e e:call g:Highe()<CR>:call g:HighE()<CR>  
" nnoremap <silent> E E:call g:Highe()<CR>:call g:HighE()<CR>  

" ""Show motion for chars:  
" nnoremap f :call g:FindChar( 'f', "forward" )<CR>  
" nnoremap t :call g:FindChar( 't', "forward" )<CR>  
" nnoremap F :call g:FindChar( 'F', "backward" )<CR>  
" nnoremap T :call g:FindChar( 'T', "backward" )<CR>  
" nnoremap ; :call g:SeekRepeat()<CR>:call g:HighRepeat()<CR>
" nnoremap , :call g:SeekReverse()<CR>:call g:HighReverse()<CR>))))

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set wildignore+=*\\public\\**
set wildignore+=*\\bower_components\\**
set wildignore+=*\\node_modules\\**

" Finally the color scheme. Choose whichever you want from the list in the
set t_Co=256
colorscheme mustang


