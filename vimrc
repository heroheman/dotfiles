" vim:fdm=marker
" .vimrc / .nvimrc
" by Florenz Heldermann - florenz.heldermann@gmail.com

" VIM-PLUG PLUGINs"{{{
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'burnettk/vim-angular'
Plug 'cakebaker/scss-syntax.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'elzr/vim-json'
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim'
Plug 'JulesWang/css.vim', {'for': ['scss','less','css']}
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'moll/vim-bbye'
Plug 'mustache/vim-mustache-handlebars'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/syntastic'
Plug 'shime/vim-livedown', { 'on': 'LivedownToggle' }
Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/vimproc.vim', { 'do' : 'make'}
Plug 'Shougo/neomru.vim',
Plug 'Shougo/vimfiler.vim',
Plug 'sjl/gundo.vim',
Plug 'sjl/vitality.vim',
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown', {'for': ['md','mdown']}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'SirVer/ultisnips'  " Reference: https://github.com/honza/vim-snippets/tree/master/snippets
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'
call plug#end()
filetype plugin indent on

" let g:plug_threads=1

" Source vimrc on saving
autocmd! bufwritepost $MYVIMRC source $MYVIMRC


"}}}
" GLOBAL SETTINGS (sets)"{{{
syntax on " Syntax highlighting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
" set smartindent " Intellegently dedent / indent new lines based on rules.
set relativenumber
set number

set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

set splitbelow        " new hoz splits go below
set splitright        " new vert splits go right

set path=$PWD/**

" don't nag me when hiding buffers"
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane"
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.un~
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set backspace=2

" comment so that the whitespace works >.>
set breakindent
set showbreak=..

" allow the cursor to go anywhere in visual block mode."
set virtualedit+=block
set linespace=10


" Resize splits when the window is resized
augroup global_autocommands
    au VimResized * exe "normal! \<c-w>="
augroup END

" Return to last edit position when opening files"
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif"

" Persistent Undo"
if exists("&undodir")
    set undodir=$HOME/.vim/undo
    set undofile          "Persistent undo! Pure money.
    set undolevels=500
    set undoreload=500
endif
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

"}}}
" SHORTCUTS"{{{

" the godlike leader key
let mapleader = ","
" let mapleader = "\<Space>"

" Quickly edit/reload the vimrc file
nnoremap <leader>ev :e $MYVIMRC<CR>
" Source this vimrc
" nmap <silent> <leader>sv :so $MYVIMRC<CR>

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>
inoremap fj <esc>

" inc / dec value
" remapped because of tmux
nnoremap <C-y> <C-a>


" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" remove unwanted trailing whitespaces in the whole file
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.  noremap j gj
noremap k gk


"}}}
" SPLITS"{{{
" Quick Split View Sizing
nnoremap <silent> <Leader>+ :vertical resize +10<CR>
nnoremap <silent> <Leader>- :vertical resize -10<CR>

" Use Arrow Keyz to resize window
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
map <leader>w <C-w>v<C-w>l
map <C-t> <esc>:tabnew<CR>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v
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

nnoremap <F10> zM

" Folding: Toggle with SPACE (in normal mode)
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Folding: Filetype Settings
" autocmd BufRead,BufEnter *.css setlocal foldmethod=marker
" autocmd BufRead,BufEnter *.scss setlocal foldmethod=marker
autocmd BufRead,BufNewFile,BufEnter *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
autocmd BufRead,BufEnter .vimrc setlocal foldmethod=marker


" autosaves and loads folding info
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"}}}
" BUFFERS"{{{
" Circling buffers
nnoremap <leader>m :bnext<CR>
nnoremap <leader>n :bprevious<CR>

" Close Buffer, but not window with vim-bbye
" maps it to leader-q" maps it to leader-q
nnoremap <Leader>q :Bdelete<CR>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>
"}}}
" Function: RELATIVENUMBER"{{{
set relativenumber
" toggle line numbering mode
if exists("+relativenumber")
    if v:version >= 400
        set number
    endif
    set relativenumber  " show relative line numbers
    set numberwidth=3   " narrow number column
    " cycles between relative / absolute / no numbering
    if v:version >= 400
        function! RelativeNumberToggle()
            if (&number == 1 && &relativenumber == 1)
                set nonumber
                set relativenumber relativenumber?
            elseif (&number == 0 && &relativenumber == 1)
                set norelativenumber
                set number number?
            elseif (&number == 1 && &relativenumber == 0)
                set norelativenumber
                set nonumber number?
            else
                set number
                set relativenumber relativenumber?
            endif
        endfunc
    else
        function! RelativeNumberToggle()
            if (&relativenumber == 1)
                set number number?
            elseif (&number == 1)
                set nonumber number?
            else
                set relativenumber relativenumber?
            endif
        endfunc
    endif
    nnoremap <silent> <leader>z :call RelativeNumberToggle()<CR>
else                  " fallback
    set number          " show line numbers
    " inverts numbering
    nnoremap <silent> <leader>z :set number! number?<CR>
endif
"}}}
" Plugin: WILDIGNORES {{{
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set wildignore+=*\\public\\**
set wildignore+=*\\bower_components\\**
set wildignore+=*\\node_modules\\**
set wildignore+=*\\.sass-cache\\**

"}}}
" Plugin: FZF"{{{
nmap <leader>f :Files<cr>
nmap <leader>g :GitFiles<cr>
nmap <leader>h :History<cr>
nmap <leader>b :Buffer<cr>
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'right':    30
\ })<CR>

fun! s:fzf_root()
    let path = finddir(".git", expand("%:p:h").";")
    return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun
"}}}
" Plugin: GOYO & LIMELIGHT"{{{

autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_default_coefficient = 0.7

"}}}
" Plugin: GUNDO"{{{
nnoremap <F6> :GundoToggle<CR>
"}}}
" Plugin: NEOCOMPLETE {{{

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() :
""\<Space>"

" }}}
" Plugin: SYNTASTIC "{{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" let g:syntastic_html_checkers = ['validator']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_ignore_errors = [
            \ 'trimming empty <i>',
            \ 'trimming empty <span>',
            \ '<input> proprietary attribute \"autocomplete\"',
            \ 'proprietary attribute \"role\"',
            \ 'proprietary attribute \"hidden\"',
            \ 'proprietary attribute \"ng-',
            \ '<svg> is not recognized!',
            \ '<use> is not recognized!',
            \ 'discarding unexpected <use>',
            \ 'discarding unexpected </use>',
            \ 'discarding unexpected <svg>',
            \ 'discarding unexpected </svg>',
            \ '<rect> is not recognized!',
            \ 'discarding unexpected <rect>'
            \ ]

"}}}
" Plugin: UltiSnips"{{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"}}}
" Plugin: ANGULAR VIM"{{{

let g:angular_filename_convention = 'camelcased'

"}}}
" Plugin: AIRLINE"{{{

" Vim Airline on single view
set laststatus=2

" Automatically displays all buffers when theres only one tab open
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_theme')
    let g:airline_theme = 'bubblegum'
endif

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

"}}}
" Plugin: TMUXLINE"{{{
let g:tmuxline_preset = {
            \'a'    : '#S',
            \'win'  : ['#I', '#W'],
            \'cwin' : ['#I', '#W', '#F'],
            \'y'    : ['%R', '%a', '%Y'],
            \'z'    : '#H'}

let g:tmuxline_powerline_separators = 0
"}}}
" Plugin: VIM-COMMENTARY:"{{{

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Use gcc to comment out a line (takes a count),
" gc to comment out the target of a motion (for example, gcap to comment out a paragraph),
" gc in visual mode to comment out the selection,
" and gc in operator pending mode to target a comment.
" You can also use it as a command, either with a range like :7,17Commentary, or as part of a :global invocation like with :g/TODO/Commentary. That's it.
" Oh, and it uncomments, too. The above maps actually toggle, and gcgc uncomments a set of adjacent commented lines.

"}}}
" Plugin: EMMET"{{{

" Remap the key to TAB
imap hh <C-y>,

"}}}
" Plugin: NETRW"{{{
let g:netrw_list_hide= '.*\.swp$,.*\.pyc,*\.un~'

autocmd FileType netrw setl bufhidden=wipe

"}}}
 " Plugin: NERDTREE "{{{
 " #deprecated

 " Open Nerdtree on Startup if no file is open
 " Incompatible with Startify
 " autocmd StdinReadPre * let s:std_in=1
 " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

 " Map :NERDTreeToggle to CTRL + T
 " map <leader>e :NERDTreeToggle<CR>
 " map <C-e> :NERDTreeToggle<CR>

 "close vim if nerdtree is the last remaining window
 " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
 " let NERDTreeHijackNetrw = 0
" "}}}
" Plugin: VIM-REPEAT"{{{

" something to repeat... some day

"}}}
" Layout: COLORSCHEME"{{{
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM =="gnome-terminal"
    set t_Co=256
    set term=screen-256color
endif
set gfn=FiraMono
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_invert_signs = 1
"}}}

