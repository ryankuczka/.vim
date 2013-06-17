" Set up required Vundle stuff {{{1
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"}}}

" {{{1 Load Plug-Ins
Bundle 'gmarik/vundle'

" {{{2 TPope Plug-Ins
Bundle 'fugitive.vim'
Bundle 'surround.vim'
Bundle 'abolish.vim'
Bundle 'unimpaired.vim'

" open fugitives git status
nnoremap <Leader>gs :Gstatus<CR>
" open fugitive's git diff for current file
nnoremap <Leader>gd :Gdiff<CR>
" close the fugitive diff pane
nnoremap <Leader>gD <C-W>h<C-W>c
" }}}

" {{{2 Plug-ins with No Settings
Bundle 'The-NERD-Commenter'
Bundle 'AutoClose'
Bundle 'Rename2'
Bundle 'Yggdroot/indentLine'
Bundle 'paradigm/TextObjectify'
Bundle 'skammer/vim-css-color'
Bundle 'suan/vim-instant-markdown'
"Bundle 'flazz/vim-colorschemes'
" }}}

" {{{2 Powerline
python import sys; sys.path.append('/Users/Ryan/Library/Python/2.7/lib/python/site-packages/')
python from powerline.vim import setup as powerline_setup; powerline_setup()
if has('gui_running')
    set guifont=Menlo\ for\ Powerline:h12
    set guioptions=egmrt
endif
" }}}

" {{{2 YouCompleteMe
Bundle 'Valloric/YouCompleteMe'

set completeopt=menuone
" ycm preview is cool, but sloooooow :(
"let g:ycm_add_preview_to_completeopt=1
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_autoclose_preview_window_after_insertion=1
" }}}

" {{{2 Git Gutter
Bundle 'airblade/vim-gitgutter'

nmap <silent> <Leader>g :GitGutterToggle<CR>
" }}}

" {{{2 Ack
Bundle 'ack.vim'

nnoremap <Leader>f :Ack<Space>
" }}}

" {{{2 Syntastic
Bundle 'scrooloose/syntastic'

map <c-s> :SyntasticCheck<CR>
let g:syntastic_mode_map = { 'mode': 'passive',
						   \ 'active_filetypes': [],
						   \ 'passive_filetypes': [] }

let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=["flake8"]
let g:syntastic_python_flake8_args='--ignore=E501,E128,E261,E262'
" }}}

" {{{2 CtrlP
Bundle 'ctrlp.vim'

let g:ctrlp_working_path_mode='ra'
" }}}

" {{{2 NERDTree
Bundle 'The-NERD-tree'

let NERDTreeIgnore = ['\.pyc$']
map <c-n> :NERDTreeToggle<CR>
map <c-l> :NERDTreeFind<CR>
" }}}

" {{{2 TagList
Bundle 'taglist.vim'

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Enable_Fold_Column=0
highlight MyTagListFileName guifg=#00d2ff ctermfg=blue
highlight MyTagListTitle guifg=#ff0086 gui=bold ctermfg=red
map ) :TlistToggle<CR>
" }}}

" {{{2 TrailingWhiteSpace
Bundle 'ShowTrailingWhitespace'
Bundle 'DeleteTrailingWhitespace'

nnoremap <Leader>d$ :<C-u>%DeleteTrailingWhitespace<CR>
let g:DeleteTrailingWhitespace = 1
" }}}

"Startify {{{
Bundle 'mhinz/vim-startify'
let g:startify_bookmarks = ['/Users/Ryan/.vimrc', '/sites/ycharts/apps/indicators/importers.py', '/sites/ycharts/apps/indicators/schedulers.py', '/Users/Ryan/indicator_boilerplate.py']
"}}}
" }}}

" {{{1 Standard Options
" {{{2 Syntax, View, and Window
filetype plugin indent on
syntax on

set t_Co=256       " sets the number of colors to 256
set background=dark
colorscheme lucius
LuciusBlackLowContrast

set number         " line numbers in gutter
set incsearch      " highlights as you search
set hlsearch       " highlights search results
"set cursorline     " highlights the line the cursor is on
set nowrap         " disables word wrapping
set scrolloff=3    " ensures that at least 3 lines of context are always visible

set laststatus=2
set noshowmode
set noruler          " shows line,col in bottom right
set showcmd        " shows the partial command in the lower right
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
set autoindent     " auto indents
set t_RV= ttymouse=xterm2

"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

if exists("+macmeta")
    set macmeta        " allow the use of alt-option key for <M- bindings (at the cost of losing ability to type accented letters)
endif
set autoread       " when a file is changed by a program other than vim while a buffer is open, automatically reload it

set nostartofline  " makes it so G, gg, <c-d>, etc. don't move cursor to start of the line
" }}}
" }}}

" {{{1 Useful Mappings
" Make j and k work better with wrapped lines
nmap j gj
nmap k gk
" Easy running of last command
nnoremap ,: :<Up>
" Maps Ctrl-Tab to move through tabs forward
nnoremap <silent> <c-Tab> :tabn<CR>
" Maps Ctrl-t to create a new tab
nnoremap <C-T> :tabnew<CR>
" Sets Esc to remove highlighting when in normal mode
nnoremap <esc> :noh<CR>

" Maps Y to y$ to work like D and C
map Y y$

" Maps J/K to move 10 lines at a time
nore J 10j
nore K 10k

" Remaps the old J to Ctrl-J
nore <C-J> J

" Keep search results in center of screen
nnoremap <silent>n nzz
nnoremap <silent>N Nzz

" Makes * not move cursor to next match
nnoremap * *<C-O>

" Allows easy switching of buffers, opens buffer list and starts buffer switch
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>v :ls<CR>:vert<Space>sb<Space>

" Find/Replace all instances of last search
nnoremap <Leader>S :%s///gc<Left><Left><Left>
nnoremap <Leader>s :s///g<Left><Left>

" Quick switch between alternate buffers
noremap <Leader><Leader> <C-^>

inoremap jj <Esc>
" Easy switch between panes
nnoremap <m-h> <c-w>h
nnoremap <m-j> <c-w>j
nnoremap <m-k> <c-w>k
nnoremap <m-l> <c-w>l
"
" Maps \cp to yank the current file path to the unnamed register
nmap <Leader>cp :let @" = expand("%:p")<CR>
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

" Sets \n to toggle between rnu and nu
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc
map <silent><Leader>n :call NumberToggle()<CR>

" Sets \w to toggle between wrap and nowrap
function! WrapToggle()
    if(&wrap == 1)
        set nowrap
    else
        set wrap
    endif
endfunc
map <silent><Leader>w :call WrapToggle()<CR>

" sets \p to run the current script and log output to a file
function! RunPython()
    execute '!nohup python ' . expand("%:p") . ' >> ~/indicator_imports_tests.out 2>&1 &'
endfunc
map <Leader>p :call RunPython()<CR>
" }}}

" Auto Commands {{{1
" Automatically set html files to be htmldjango filetype
au BufRead,BufNewFile *.html set filetype=htmldjango
au BufRead,BufNewFile *.md set filetype=markdown
"au FileType htmldjango let g:autoclose_on=1
"au InsertEnter,BufLeave,FocusLost *.py,*.html,*.md,*.js set nu
"au InsertLeave,BufEnter,FocusGained *.py,*.html,*.md,*.js set rnu
"}}}

" Storing registers {{{
let @d = '/delay_initial_importfFceTrue$@d'
let @e = '/delay_initial_importfTceFalse$@e'
"}}}
