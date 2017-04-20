" vim:fdm=marker
" .vimrc / .nvimrc
" by Florenz Heldermann - florenz.heldermann@gmail.com

" PLUGINS: Vim-Plug"{{{
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')

" PLUGINS: Global"{{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'moll/vim-bbye'
Plug 'mhinz/vim-signify'
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/neomru.vim',
Plug 'sjl/gundo.vim',
Plug 'sjl/vitality.vim',
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-dirvish'
Plug 'morhetz/gruvbox'
"}}}
" PLUGINS: Dev Global"{{{
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
"}}}
" PLUGINS: SyntaxChecking"{{{
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
"}}}
"PLUGINS: Markup"{{{
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-markdown', {'for': ['md','mdown']}
Plug 'mustache/vim-mustache-handlebars'
"}}}
"PLUGINS: CSS"{{{
Plug 'cakebaker/scss-syntax.vim', {'for': ['scss', 'sass']}
Plug 'JulesWang/css.vim', {'for': ['scss','less','css']}
Plug 'luishdez/vim-less', {'for': ['less']}
Plug 'csscomb/vim-csscomb'
Plug 'wavded/vim-stylus'
" Plug 'ap/vim-css-color'
" Plug 'gcorne/vim-sass-lint', {'for': ['scss']}
"}}}
"PLUGINS: Javascript"{{{
Plug 'burnettk/vim-angular'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
"}}}
"PLUGINS: Tools"{{{
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'Alok/notational-fzf-vim'
Plug 'shime/vim-livedown'
Plug 'wakatime/vim-wakatime'
"}}}
"PLUGINS: Snipmate"{{{
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
"}}}
"PLUGINS: Snippets:"{{{
Plug 'honza/vim-snippets'
Plug 'bentayloruk/vim-react-es6-snippets'
"}}}

call plug#end()
filetype plugin indent on

" let g:plug_threads=1

" Source vimrc on saving
" autocmd! bufwritepost $MYVIMRC 
" Airline Reienit after that
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"}}}
" GLOBAL SETTINGS (sets)"{{{
syntax on " Syntax highlighting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab       " use spaces instead of tabs.
set smarttab        " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround      " tab / shifting moves to closest tabstop.
set autoindent      " Match indents on new lines.
" set smartindent     " Intellegently dedent / indent new lines based on rules.
set relativenumber
set number

set nobackup        " We have vcs, we don't need backups.
set nowritebackup   " We have vcs, we don't need backups.
set noswapfile      " They're just annoying. Who likes them?

set splitbelow      " new hoz splits go below
set splitright      " new vert splits go right

set path=$PWD/**

" don't nag me when hiding buffers"
set hidden          " allow me to have buffers with unsaved changes.
set autoread        " when a file has changed on disk, just load it. Don't ask.

" Make search more sane"
set ignorecase      " case insensitive search
set smartcase       " If there are uppercase letters, become case-sensitive.
set incsearch       " live incremental searching
set showmatch       " live match highlighting
set hlsearch        " highlight matches
set gdefault        " use the `g` flag by default.

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
" augroup global_autocommands
"     au VimResized * exe "normal! \<c-w>="
" augroup END

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

" Neovim: Pipe Cursor in insert mode
if has('nvim')
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

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

" simple clipboardtesting
" http://tilvim.com/2014/03/18/a-better-paste.html
map <Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"

" remove unwanted trailing whitespaces in the whole file
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.  noremap j gj
noremap k gk

" Jump to last line of file and center it on screen
nnoremap G Gzz

inoremap {<Tab> {<CR>}<Esc>O<Tab>}

nnoremap <leader>k :ls<cr>:b<space>
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
if has('vim')
    autocmd BufWinEnter *.* silent loadview
endif

"}}}
" BUFFERS"{{{
" Circling buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

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
nmap <leader>c :Commits!<cr>
nmap <leader>x :BCommits<cr>
nmap <leader>g :GitFiles<cr>
nmap <leader>h :History<cr>
nmap <leader>b :Buffer<cr>
nmap <leader>l :BLines<cr>

" Color Schemes
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'right':    30
\ })<CR>

" change root to git
fun! s:fzf_root()
    let path = finddir(".git", expand("%:p:h").";")
    return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~60%' }

" Augmenting Ag command using fzf#vim#with_preview function
"    * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"    * For syntax-highlighting, Ruby and any of the following tools are
" required:
"   - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"   - CodeRay: http://coderay.rubychan.de/
"   - Rouge: https://github.com/jneen/rouge
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden','?'),
      \                 <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GFiles
    \ call fzf#vim#gfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

"}}}
" Plugin: EDITORCONFIG"{{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
"}}}
" Plugin: GOYO & LIMELIGHT"{{{

autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_default_coefficient = 0.7

"}}}
" Plugin: NOTATIONAL FZF VIM"{{{
let g:nv_directories = ['~/Google Drive/nvAlt/wiki', '~/Google Drive/nvAlt/writing', '~/Google Drive/nvAlt/code']
" Don't forget the dot, unless you don't want one.
let g:nv_default_extension = '.md'
" let g:nv_main_directory = g:nv_directories[0] 
" default is first in directory list

" Default Shortcuts
nnoremap <c-s> :NV<CR>
" c-x: Use search string as filename and open in vertical split
" c-v: Open in vertical split
" c-s: Open in horizontal split
" c-t: Open in new tab
" <Enter>: Open highlighted search result in current buffer

"}}}
" Plugin: GUNDO"{{{
nnoremap <F6> :GundoToggle<CR>
"}}}
" Plugin: PEEKABOO"{{{
let g:peekaboo_window = 'vertical botright 50new'"}}}
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
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_scss_checkers = ['scss_lint']

" " let g:syntastic_html_checkers = ['validator']
" let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_html_tidy_ignore_errors = [
"             \ 'trimming empty <i>',
"             \ 'trimming empty <span>',
"             \ '<input> proprietary attribute \"autocomplete\"',
"             \ 'proprietary attribute \"role\"',
"             \ 'proprietary attribute \"hidden\"',
"             \ 'proprietary attribute \"ng-',
"             \ '<svg> is not recognized!',
"             \ '<use> is not recognized!',
"             \ 'discarding unexpected <use>',
"             \ 'discarding unexpected </use>',
"             \ 'discarding unexpected <svg>',
"             \ 'discarding unexpected </svg>',
"             \ '<rect> is not recognized!',
"             \ 'discarding unexpected <rect>'
"             \ ]

"}}}
" Plugin: Ale"{{{
let g:ale_linters = {
\   'javascript': ['tidy','jsonlint','scss-lint','yamllint','eslint'],
\}

" let g:ale_sign_column_always = 1
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠️'
"}}}
" Plugin: ULTISNIPS"{{{
let g:UltiSnipsExpandTrigger="<c-g>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"}}}
" Plugin: Snipmate"{{{

imap kk <Plug>snipMateNextOrTrigger

"}}}
" Plugin: ANGULAR VIM"{{{

let g:angular_filename_convention = 'camelcased'

"}}}
"PLUGIN: VIM-JSX"{{{

" Allow syntax also for js files
let g:jsx_ext_required = 0
"}}}
" Plugin: AIRLINE"{{{

" Vim Airline on single view
set laststatus=2

" Automatically displays all buffers when theres only one tab open
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_theme')
    let g:airline_theme = 'badwolf'
endif

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 1

"}}}
" Plugin: LIVEDOWN"{{{

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1 

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use
let g:livedown_browser = "chrome"

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
let g:netrw_liststyle=1

autocmd FileType netrw setl bufhidden=wipe

"}}}
" Plugin: DIRVISH"{{{
autocmd FileType dirvish call fugitive#detect(@%)
"}}}
" Layout: COLORSCHEME"{{{
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM =="gnome-terminal"
    set t_Co=256
    if has('vim')
        set term=screen-256color
    endif
endif
set gfn=InputMono
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_invert_signs = 1
"}}}

