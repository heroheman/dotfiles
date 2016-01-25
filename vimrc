" vim:fdm=marker
" .vimrc / .nvimrc
" by Florenz Heldermann - florenz.heldermann@gmail.com

" VIM-PLUG PLUGINs"{{{
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'burnettk/vim-angular'
Plug 'cakebaker/scss-syntax.vim'
Plug 'csscomb/vim-csscomb'
Plug 'edkolev/tmuxline.vim'
Plug 'elzr/vim-json'
Plug 'editorconfig/editorconfig-vim'
Plug 'groenewege/vim-less'
Plug 'godlygeek/tabular', { 'on': 'Tab' }
Plug 'JulesWang/css.vim', {'for': ['scss','less','css']}
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' } 
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mhinz/vim-startify'
Plug 'moll/vim-bbye'
Plug 'mustache/vim-mustache-handlebars'
Plug 'NLKNguyen/papercolor-theme'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'shime/vim-livedown'
Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do' : 'make'}
Plug 'Shougo/neomru.vim',
Plug 'Shougo/vimfiler.vim',
Plug 'sjl/gundo.vim',
Plug 'sjl/vitality.vim',
Plug 'terryma/vim-multiple-cursors'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown', {'for': ['md','mdown']}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wincent/terminus'
Plug 'ryanoasis/vim-devicons'
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
    set undofile          "Persistent undo! Pure money.
    let &undodir=&directory
    set undolevels=500
    set undoreload=500
endif
set backupdir=~/.vim/backup//
set directory=~/.vim/swp//

"}}}
" SHORTCUTS"{{{

" the godlike leader key
let mapleader = ","

" Quickly edit/reload the vimrc file
nnoremap <leader>ev :e $MYVIMRC<CR>
" no longer necessary
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

" Quick Word replacement - see: http://vimrcfu.com/snippet/30
nnoremap <leader>r :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <leader>R :%s/\<<C-r>=expand('<cword>')<CR>\>/'

" remove unwanted trailing whitespaces in the whole file
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


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
" KEYBOARD LAYOUT SPECIFIC"{{{
" because of clumsy fingers and too fast typing, this is life-saving (for me)
" makes only sense on qwertz keyboards / if you need to press shift
" command! WQ wq
" command! Wq wq
" command! W w
" command! Q q

" jump to end of line - easier to reach / only useful on qwertz
" nnoremap ß $

" qwerty map 
noremap ; :
"}}}
" WILDIGNORES {{{
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set wildignore+=*\\public\\**
set wildignore+=*\\bower_components\\**
set wildignore+=*\\node_modules\\**
set wildignore+=*\\.sass-cache\\**

"}}}
" RELATIVENUMBER"{{{
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
" UNITE "{{{
let g:unite_source_history_yank_enable=1
let g:unite_source_history_yank_limit=1000
let g:unite_source_grep_max_candidates = 200

if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '-i --vimgrep --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif

call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', join([
            \ '\.\(git\|svn\|vagrant\)\/', 
            \ 'tmp\/',
            \ 'dist\/',
            \ 'public\/',
            \ 'core\/',
            \ 'app\/storage\/',
            \ 'bower_components\/',
            \ 'fonts\/',
            \ 'sass-cache\/',
            \ 'node_modules\/',
            \ '\.\(jpe?g\|gif\|png\)$',
            \ ], 
            \ '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#profile('files', 'filters', ['sorter_rank'])

autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction


nnoremap <leader>y :Unite -no-split -buffer-name=YANK history/yank<cr>
" nnoremap <leader>f :Unite -start-insert file_rec<CR>
nnoremap <leader>g :Unite -buffer-name=FILES -start-insert file_rec/async<CR>
nnoremap <leader>b :Unite -no-split -buffer-name=BUFFERS buffer<CR>'
nnoremap <leader>a :UniteResume<CR>
nnoremap <leader>an :UnitePrevious<CR>
nnoremap <leader>am :UniteNext<CR>

nnoremap <Leader>/ :Unite -buffer-name=ag grep:.<CR>
" nnoremap <F6> :Unite -start-insert -auto-resize file file_rec/async file_mru everything<CR>


"}}}
" FZF"{{{
nmap <leader>f :FZF<cr>
"}}}
" GOYO & LIMELIGHT"{{{

autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_default_coefficient = 0.7

"}}}
" GUNDO"{{{
nnoremap <F6> :GundoToggle<CR>
"}}}
" NEOCOMPLETE {{{
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
" SYNTASTIC "{{{
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
" ANGULAR VIM"{{{
let g:angular_filename_convention = 'camelcased'
"}}}
" AIRLINE"{{{

" Vim Airline on single view
set laststatus=2

" Automatically displays all buffers when theres only one tab open
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_theme')
    let g:airline_theme = 'papercolor'
endif
let g:airline_powerline_fonts=1
if !exists('g:airline_powerline_fonts')
    let g:airline_left_sep='â€º'
    let g:airline_right_sep='â€¹'
endif"
"}}}
" TMUXLINE"{{{
let g:tmuxline_preset = {
            \'a'    : '#S',
            \'win'  : ['#I', '#W'],
            \'cwin' : ['#I', '#W', '#F'],
            \'y'    : ['%R', '%a', '%Y'],
            \'z'    : '#H'}
"}}}
" iTerm2"{{{

" Change Cursor in insert Mode
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.  noremap j gj
noremap k gk

"}}}
" VIM-COMMENTARY:"{{{

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Use gcc to comment out a line (takes a count), 
" gc to comment out the target of a motion (for example, gcap to comment out a paragraph), 
" gc in visual mode to comment out the selection, 
" and gc in operator pending mode to target a comment. 
" You can also use it as a command, either with a range like :7,17Commentary, or as part of a :global invocation like with :g/TODO/Commentary. That's it.
" Oh, and it uncomments, too. The above maps actually toggle, and gcgc uncomments a set of adjacent commented lines.

"}}}
" CTRL-P"{{{

" Let ctrlp have up to 30 results.
" let g:ctrlp_max_height = 30

"}}}
" EMMET"{{{

" Remap the key to TAB
imap hh <C-y>, 

"}}}
" NETRW"{{{
let g:netrw_list_hide= '.*\.swp$,.*\.pyc,*\.un~'

"}}}
 " NERDTREE "{{{

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
" VIMFILER

" nmap - :VimFiler -toggle<CR>
" nmap <leader>vf :VimFilerSplit -toggle -no-quit<CR>

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = '\.git\|\.DS_Store\|\.pyc'

nnoremap <Leader>e :<C-u>VimFilerExplorer -split -simple -parent -winwidth=55 -toggle -no-quit<CR>
nnoremap <C-e> :<C-u>VimFilerExplorer -split -simple -parent -winwidth=45 -toggle -no-quit<CR>
nnoremap <Leader>jf :<C-u>VimFilerExplorer -split -simple -parent -winwidth=55 -no-quit -find<CR>
autocmd FileType vimfiler nunmap <buffer> x
autocmd FileType vimfiler nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
autocmd FileType vimfiler vmap <buffer> x <Plug>(vimfiler_toggle_mark_selected_lines)
autocmd FileType vimfiler nunmap <buffer> l
autocmd FileType vimfiler nmap <buffer> l <Plug>(vimfiler_cd_or_edit)
autocmd FileType vimfiler nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
autocmd FileType vimfiler nmap <buffer> <C-r>  <Plug>(vimfiler_redraw_screen)
autocmd FileType vimfiler nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
autocmd FileType vimfiler nunmap <buffer> g
autocmd FileType vimfiler nmap <buffer> g  <Plug>(vimfiler_grep)
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
\ "\<Plug>(vimfiler_expand_tree)",
\ "\<Plug>(vimfiler_edit_file)")

" FILEBEAGLE"{{{
" map <C-e> :FileBeagle<CR>
" o - direct editing
" CTRL V - new veritcal split
" CTRL S - new Horizontal split
"}}}
" TAGBAR "{{{
nmap <F8> :TagbarToggle<CR>
"}}}
" VIM-REPEAT"{{{

" silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"}}}
" TABULAR"{{{

if exists(":Tabularize")
    nmap <Leader>t= :Tabularize /=<CR>
    vmap <Leader>t= :Tabularize /=<CR>
    nmap <Leader>t: :Tabularize /:\zs<CR>
    vmap <Leader>t: :Tabularize /:\zs<CR>
endif

"}}}
" Multiple Cursors"{{{

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"}}}
" WEBDEV ICONS"{{{
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
let g:webdevicons_enable_unite = 1
let g:webdevicons_conceal_nerdtree_brackets = 0
"}}}
" COLORSCHEME"{{{
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM =="gnome-terminal"
    set t_Co=256
    set term=screen-256color
endif
set gfn=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_invert_signs = 1
"}}}

