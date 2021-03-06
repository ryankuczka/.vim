" Ryan Kuczka

" Set up required Vundle stuff
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" {{{1 Load Plug-Ins
" map leader up here so it takes effect
let mapleader = ','

Bundle 'gmarik/vundle'

" {{{2 TPope Plug-Ins
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'

" open fugitives git status
nnoremap <Leader>gs :Gstatus<CR>
" open fugitive's git diff for current file
nnoremap <Leader>gd :Gdiff<CR>
" close the fugitive diff pane
nnoremap <Leader>gD <C-W>c
" open the current file on github
nnoremap <Leader>gb :<C-R>=line('.')<CR>Gbrowse@ryan<CR>
vnoremap <Leader>gb :Gbrowse@ryan<CR>
" pull/push
nnoremap <Leader>gcd :Git checkout develop<CR>
nnoremap <Leader>gpl :Git pull origin develop<CR>
nnoremap <Leader>gpr :Git push ryan <C-R>=fugitive#head()<CR><CR>
" }}}
" {{{2 Plug-ins with No Settings
Bundle 'Rename2'
Bundle 'takac/vim-commandcaps'
Bundle 'lilydjwg/colorizer'
" }}}
" {{{2 Airline
Bundle 'bling/vim-airline'
" Enable powerline fonts
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#branch#symbol = ' '
let g:airline#extensions#readonly#symbol = ''
let g:airline_linecolumn_prefix = ' '

let g:airline_theme='lucius'

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'
"let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"
"let g:airline#extensions#promptline#enabled = 1
"let g:airline#extensions#promptline#color_template = 'visual'
"let g:airline#extensions#tmuxline#color_template = 'visual'
" }}}
" {{{2 Tagbar
Bundle 'majutsushi/tagbar'
" }}}
" {{{2 YouCompleteMe
Bundle 'Valloric/YouCompleteMe'

set completeopt=menuone
" ycm preview is cool, but sloooooow :(
"let g:ycm_add_preview_to_completeopt=1
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_autoclose_preview_window_after_insertion=1
" }}}
" Gundo {{{2
Bundle 'sjl/gundo.vim'
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_preview_bottom=1
"}}}
" {{{2 IndentLine
Bundle 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
" }}}
" {{{2 Instant Markdown
Bundle 'suan/vim-instant-markdown'
let g:instant_markdown_slow = 1
" }}}
" {{{2 Ag
Bundle 'rking/ag.vim'

nnoremap <Leader><Leader>f :Ag<Space>
" }}}
" {{{2 Syntastic
Bundle 'scrooloose/syntastic'

map <c-a> :SyntasticCheck<CR>
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=["flake8"]
let g:syntastic_python_flake8_args='--ignore=E501,E128,E261,E262'
let g:syntastic_javascript_checkers=["jshint"]
let g:syntastic_javascript_jshint_args='--config /sites/ycharts/confs/developers/jshint_conf.json'
" }}}
" {{{2 CtrlP
Bundle 'kien/ctrlp.vim'
Bundle 'JazzCore/ctrlp-cmatcher'

let g:ctrlp_working_path_mode='ra'
let g:ctrlp_max_files=0
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files . -co --exclude-standard', 'ag %s -l --nocolor -g ""']
let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
" }}}
" {{{2 NERDTree
Bundle 'The-NERD-tree'

let NERDTreeIgnore = ['\.pyc$']
map <leader><c-n> :NERDTreeToggle<CR>
map <leader><c-l> :NERDTreeFind<CR>
" }}}
" {{{2 TrailingWhiteSpace
Bundle 'ShowTrailingWhitespace'
Bundle 'DeleteTrailingWhitespace'

nnoremap <Leader>d$ :<C-u>%DeleteTrailingWhitespace<CR>
let g:DeleteTrailingWhitespace = 1
" }}}
" {{{2 Easymotion
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>'
" }}}
" {{{2 Tabularize
Bundle 'godlygeek/tabular'
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
"}}}
" {{{2 GitGutter
Bundle 'airblade/vim-gitgutter'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
" }}}
" {{{2 Signiture
Bundle 'kshenoy/vim-signature'
let g:SignatureMarkTextHL = 'SignColumn'
"}}}
" Color schemes {{{
Bundle 'jonathanfilip/vim-lucius'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'sjl/badwolf'
Bundle 'vim-scripts/Sorcerer'
Bundle 'jnurmine/Zenburn'
Bundle 'tejr/sahara'
Bundle 'Pychimp/vim-luna'
Bundle 'matthewtodd/vim-twilight'
Bundle 'w0ng/vim-hybrid'
Bundle 'tomasr/molokai'
" }}}
" {{{2 Syntax files
Bundle 'hdima/python-syntax'
let python_version_2 = 1
let python_highlight_all = 1
Bundle 'evanmiller/nginx-vim-syntax'
Bundle 'groenewege/vim-less'
" }}}
" }}}
" {{{1 Tmux and Bash
Bundle 'edkolev/promptline.vim'
let git_modified_slice = {
    \'function_name' : 'git_modified',
    \'function_body' : [
        \'function git_modified {',
        \'  [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == true ]] || return 1',
        \'  local modified_count=0 unmerged_count=0 added_count=0',
        \'  local modified_symbol="M" unmerged_symbol="U" added_symbol="A"',
        \'  while read line; do',
        \'    case "$line" in',
        \'      M*) modified_count=$(( $modified_count + 1 )) ;;',
        \'      U*) unmerged_count=$(( $unmerged_count + 1 )) ;;',
        \'    esac',
        \'  done < <(git diff --name-status)',
        \'  while read line; do',
        \'    case "$line" in',
        \'      *) added_count=$(( $added_count + 1 )) ;;',
        \'    esac',
        \'  done < <(git diff --name-status --cached)',
        \'  local leading_whitespace=""',
        \'  [[ $modified_count -gt 0 ]] && { printf "%s" "$leading_whitespace$modified_count$modified_symbol"; leading_whitespace=" "; }',
        \'  [[ $unmerged_count -gt 0 ]] && { printf "%s" "$leading_whitespace$unmerged_count$unmerged_symbol"; leading_whitespace=" "; }',
        \'  [[ $added_count -gt 0 ]]    && { printf "%s" "$leading_whitespace$added_count$added_symbol"; leading_whitespace=" "; }',
        \'}']}
let git_untracked_slice = {
    \'function_name' : 'git_untracked',
    \'function_body' : [
        \'function git_untracked {',
        \'  [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == true ]] || return 1',
        \'  if [ -n "$(git ls-files --others --exclude-standard)" ]; then',
        \'    echo "+"',
        \'  fi',
        \'}']}
let git_ahead_behind_slice = {
    \'function_name' : 'git_ahead_behind',
    \'function_body' : [
        \'function git_ahead_behind {',
        \'  [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == true ]] || return 1',
        \'  set -- $(git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null)',
        \'  local behind_count=$1',
        \'  local ahead_count=$2',
        \'  local ahead_symbol="↑"',
        \'  local behind_symbol="↓"',
        \'  local leading_whitespace=""',
        \'  [[ $behind_count -gt 0 ]] && { printf "%s" "$leading_whitespace$behind_count$behind_symbol"; leading_whitespace=" "; }',
        \'  [[ $ahead_count -gt 0 ]]  && { printf "%s" "$leading_whitespace$ahead_count$ahead_symbol"; leading_whitespace=" "; }',
        \'}']}
let g:promptline_preset = {
    \'a' : [ promptline#slices#python_virtualenv() ],
    \'b' : [ promptline#slices#user(), promptline#slices#host() ],
    \'c' : [ promptline#slices#cwd() ],
    \'y' : [ promptline#slices#vcs_branch() ],
    \'z' : [ git_ahead_behind_slice, git_modified_slice, git_untracked_slice ],
    \'warn': [ promptline#slices#last_exit_code() ]}
let g:promptline_theme = 'airline'
" }}}
" {{{1 Standard Options
" {{{2 Syntax, View, and Window
filetype plugin indent on
syntax on

set t_Co=256       " sets the number of colors to 256
colorscheme lucius
"set background=dark
LuciusDarkLowContrast
hi SignColumn guifg=#5fafd7 guibg=#444444
"hi Special term=bold ctermfg=167 gui=bold guifg=#cc6666

" set both types of number to have abs number instead of zero in rnu
set relativenumber
set number
set incsearch      " highlights as you search
set hlsearch       " highlights search results
set nowrap         " disables word wrapping
set scrolloff=3    " ensures that at least 3 lines of context are always visible

set laststatus=2
set noshowmode
set noruler          " shows line,col in bottom right
set showcmd        " shows the partial command in the lower right
set list listchars=tab:⇥⇥ " turns hard tabs into this character

if has('gui_running')
    set guifont=Sauce\ Code\ Powerline:h13
    set guioptions=egmrt
endif
" }}}
" {{{2 <Tab> and Indenting
set tabstop=4      " sets the length of the tab to 4 spaces
set shiftwidth=4   " sets the (auto)indent to 4 spaces
set softtabstop=4  " sets number of spaces to insert for a <Tab>
set smarttab       " a <Tab> will insert 'shiftwidth' spaces
set expandtab      " a <Tab> is expanded to spaces in Insert mode
" }}}
" {{{2 Command Line
set wildmode=longest,list,full " specifies that pressing <Tab> will complete to longest common substring, then a list of options, then cycle through all options
set wildmenu       " command line completion will show a menu of matches
set wildignore=*.pyc " patterns to ignore for file name completion
" }}}
" {{{2 Folding
set foldmethod=marker " allows setting a marker to specify where a fold occurs
set foldmarker={{{,}}} " sets the fold marker to {{{ to start and }}} to end
set foldlevel=99
" }}}
" {{{2 Buffers, Search
set ignorecase     " ignores case for search
set smartcase      " overrides ignorecase if search pattern has upper case letters

set hidden         " doesn't unload a buffer when it is no longer in a window
set eol            " ensures the last line in the file has an end of line
" }}}
" {{{2 Etc.
set virtualedit=block " only allows the cursor to go where there is no character in Visual Block mode
set undofile       " save/restore undo history
set undodir=~/.vim/undodir
set autoindent     " auto indents
set t_RV= ttymouse=xterm2

set autoread       " when a file is changed by a program other than vim while a buffer is open, automatically reload it

set nostartofline  " makes it so G, gg, <c-d>, etc. don't move cursor to start of the line

set modeline       " Allow for modelines
set modelines=1    " Only check 1 modeline

if exists('&macmeta')
    set macmeta
endif
" }}}
" }}}
" {{{1 Useful Mappings
" Make j and k work better with wrapped lines
map j gj
map k gk

noremap J 10j
noremap K 10k

noremap <Leader>J Jx
noremap <Leader><c-j> J

" Set <Space> to enter command
nnoremap <Space> :

" Sets \ to remove highlighting when in normal mode
nnoremap \ :noh<CR>

" Maps Y to y$ to work like D and C
map Y y$

" Keep search results in center of screen
nnoremap <silent>n nzz
nnoremap <silent>N Nzz

" Makes */N not move cursor to next match
" Use <C-O> instead of N to not move cursor at all
nnoremap * *N
nnoremap # #N

" Make Q run the q macro instead of Ex mode
nnoremap Q @q

" Quick switch between alternate buffers
noremap <Leader><Leader><Space> <C-^>

" Easy switch between panes
nnoremap <m-h> <c-w>h
nnoremap <m-j> <c-w>j
nnoremap <m-k> <c-w>k
nnoremap <m-l> <c-w>l
" Easy resizing of panes
nnoremap <m-+> <c-w>+
nnoremap <m--> <c-w>-
nnoremap <m->> <c-w>>
nnoremap <m-<> <c-w><
"
" Maps \cp to yank the current file path to the unnamed register
nmap <Leader>cp :let @" = &filetype . ' ' . expand("%:p") . "\n"<CR>

" Allows looking up the syntax under the cursor
nmap <F10> :echo "hi<" .synIDattr(synID(line('.'),col('.'),1),'name'). '> trans<'
            \ .synIDattr(synID(line('.'),col('.'),0),'name'). '> lo<'
            \ .synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name'). '>'<CR>
" }}}
" {{{1 Functions
" Function to insert a debug trace for python and javascript and map to Ctrl-i
nnoremap <c-i> :call InsertDebugTrace()<CR>
function! InsertDebugTrace()
    if (&ft == 'python')
        normal! Oimport ipdb; ipdb.set_trace()
    elseif (&ft == 'javascript')
        normal! Odebugger;
    endif
    :w
endfunction
" }}}
" Auto Commands {{{1
" Automatically set html files to be htmldjango filetype
augroup FileTypeConfs
    autocmd!
    autocmd BufRead,BufNewFile *.html set filetype=htmldjango
    autocmd BufRead,BuFNewFile *.tpl set filetype=htmldjango
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead *nginx_ycharts* set filetype=nginx
    autocmd BufRead *ycharts*cron.txt set filetype=crontab
    autocmd QuickFixCmdPost *grep* cwindow
augroup END

" Set cursorline and cursorcolumn (crosshairs) in active window only
augroup CursorLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    autocmd WinLeave * setlocal nocursorline
    autocmd WinLeave * setlocal nocursorcolumn
augroup END
"}}}

" try to source local vimrc
" for stuff like powerline
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" vim:foldlevel=0
