if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'corntrace/bufexplorer'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dgryski/vim-godef'
Plug 'tc50cal/vim-terminal'
Plug 'vim-scripts/ZoomWin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'urbainvaes/vim-tmux-pilot'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'chrisbra/changesplugin'
Plug 'mileszs/ack.vim'
Plug 'stephpy/vim-yaml'
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasr/molokai'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'eslint/eslint'
Plug 'mattn/emmet-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kylef/apiblueprint.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/CSApprox'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'mattn/emmet-vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/groovy.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'gilligan/vim-lldb'
Plug 'chrisbra/Colorizer'
Plug 'ternjs/tern_for_vim'
Plug 'posva/vim-vue'
Plug 'sekel/vim-vue-syntastic'
Plug 'ramitos/jsctags'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'mxw/vim-jsx'
Plug 'jaxbot/syntastic-react'
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


set guifont=Monaco\ for\ Powerline:h14.5
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set number
set fillchars+=stl:\ ,stlnc:\
syntax enable
set spell spelllang=en_us

" These lines setup the environment to show graphics and colors correctly.
set nocompatible

let g:minBufExplForceSyntaxEnable = 1

if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif

" auto clear whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
    endfun
autocmd FileType * autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode

set backspace=indent,eol,start
set hlsearch
set foldmethod=indent

" autosave
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'test']
let g:go_metalinter_deadline = "5s"


syntax on
color dracula

let g:go_version_warning = 0

" Tagbar comfiguration for go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_javascript = {
      \ 'ctagstype': 'javascript',
      \ 'kinds': [
      \ 'A:arrays',
      \ 'P:properties',
      \ 'T:tags',
      \ 'O:objects',
      \ 'G:generator functions',
      \ 'F:functions',
      \ 'C:constructors/classes',
      \ 'M:methods',
      \ 'V:variables',
      \ 'I:imports',
      \ 'E:exports',
      \ 'S:styled components']
\ }

" To toggle nerdtree enable/disable
let NERDTreeMapOpenInTab='<C+CR>'
map <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
map <F4> :Ack<space>

nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode


" vim-nerdtree-tabs
let g:nerdtree_tabs_open_on_gui_startup = 2 "set to 2, open only if directory was given as startup argument).
let g:nerdtree_tabs_open_on_console_startup = 2 "set to 2, open only if directory was given as startup argument).

let g:indent_guides_enable_on_vim_startup = 1

set shiftwidth=2 tabstop=2
autocmd FileType python,groovy,javascript,coffeescript,html,vue set shiftwidth=2 tabstop=2 expandtab

autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
autocmd FileType go nmap <Leader>t <Plug>(go-def-tab)

" vim-tmux-pilot
" Uncomment to enable navigation of vim tabs
 let g:pilot_mode='wintab'

" Uncomment to enable creation of vim splits automatically
" let g:pilot_boundary='create'


"" vim-go
let g:go_def_mode = 'godef'
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_term_enabled = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
let g:go_metalinter_autosave = 0 " disabled and replace with syntastic checking
let g:go_metalinter_autosave_enabled = [
      \  'goimports',
      \  'golint',
      \  'vet',
      \]

hi link goModuleKeyword		Identifier
hi link goVariableDef		Identifier
hi link goFuncArgs		Identifier
hi link goFuncCall		Function
hi link goObjectProp		Identifier
hi link goObjectKey		Label
hi link goObjectValue		Normal


" syntastic
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = '!'
let g:syntastic_style_warning_symbol = '?'

let g:syntastic_shell = "/bin/sh"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <F5> :SyntasticCheck<CR>
nnoremap <F6> :SyntasticToggleMode<CR>
let g:go_list_type = 'quickfix'
let g:syntastic_go_checkers = [ 'golint', 'govet', 'gofmt']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jshint_quiet_messages = { "level": "warnings" }
let g:syntastic_vue_checkers = ['eslint']
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
    let g:syntastic_vue_eslint_exec = local_eslint
endif

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_checkers = ['cpplint', 'gcc']
let g:syntastic_cpp_cpplint_thres = 1
let syntastic_aggregate_errors = 1

" ctrlp
let g:ctrlp_working_path_mode = 'c' " 'c' - the directory of the current file.
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" <Page Up/Down> change tab
nmap <PageUp> :tabprevious<CR>
nmap <PageDown> :tabnext<CR>
nmap <Leader>+ :tabnew<CR>


" UltiSnip
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_key_list_select_completion = ['<C-n>', '<space>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_gocode_binary_path = '/Users/yinchen/.gvm/pkgsets/go1.11.9/global/bin/gocode-gomod'
let g:ycm_godef_binary_path = '/Users/yinchen/.gvm/pkgsets/go1.11.9/global/bin/godef'

let g:ycm_auto_trigger = 1

" let g:ycm_semantic_triggers =  {
"   \   'go': ['.', '\w{2}' ],
"   \   'c' : ['->', '.'],
"   \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
"   \             're!\[.*\]\s'],
"   \   'ocaml' : ['.', '#'],
"   \   'cpp,objcpp' : ['->', '.', '::'],
"   \   'perl' : ['->'],
"   \   'php' : ['->', '::'],
"   \   'java,javascript,typescript,d,python,perl6,scala' : ['.'],
"   \   'ruby' : ['.', '::'],
"   \   'lua' : ['.', ':'],
"   \   'erlang' : [':'],
"   \ }

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" emmet css
let g:user_emmet_install_global = 0
autocmd FileType *.htm,*.css EmmetInstall
autocmd FileType *.html imap <c-_> <c-y>/
autocmd FileType *.html map <c-_> <c-y>/

autocmd FileType *.vue syntax sync fromstart
autocmd FileType *.html,*.css,*.js,*.vue ColorHighlight
set cursorcolumn
set cursorline

"set completeopt+=noselect

"set statusline=
"set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
"set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
"set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
"set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
"set statusline+=\ %n\           " buffer number
"set statusline+=%#Visual#       " colour
"set statusline+=%{&paste?'\ PASTE\ ':''}
"set statusline+=%{&spell?'\ SPELL\ ':''}
"set statusline+=%#CursorIM#     " colour
"set statusline+=%R                          " readonly flag
"set statusline+=%M                           " modified [+] flag
"set statusline+=%#Cursor#                " colour
"set statusline+=%#CursorLine#      " colour
"set statusline+=\ %t\                     " short file name
"set statusline+=%=                            " right align
"set statusline+=%#CursorLine#   " colour
"set statusline+=\ %Y\                     " file type
"set statusline+=%#CursorIM#     " colour
"set statusline+=\ %3l:%-2c\         " line + column
"set statusline+=%#Cursor#       " colour
"set statusline+=\ %3p%%\                 " percentage

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

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

set guifont=Source\ Code\ Pro\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2
set t_Co=256
