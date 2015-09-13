if has('vim_starting')
    "Use Vim settings, rather then Vi settings (much better!).
    "This must be first, because it changes other options as a side effect.
    set nocompatible

    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

  " vimproc
  NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make -f make_mac.mak',
        \     'unix' : 'make -f make_unix.mak',
        \    },
        \ }

  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/neocomplete.vim'

  NeoBundle 'ujihisa/neco-look'

  " comment stuff out
  NeoBundle 'tpope/vim-commentary'

  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'scrooloose/syntastic'

  NeoBundle 'editorconfig/editorconfig-vim'

  " UltiSnips
  NeoBundle 'SirVer/ultisnips'
  NeoBundle 'honza/vim-snippets'

  " EasyMotion
  NeoBundle 'Lokaltog/vim-easymotion'

  " airline
  NeoBundle 'bling/vim-airline'

  " session
  NeoBundle 'xolox/vim-session'
  NeoBundle 'xolox/vim-misc'

  " Fuzzy file, buffer, mru, tag, etc finder.
  NeoBundle 'ctrlpvim/ctrlp.vim'

  " a ctrlp.vim extension - Navigate and jump to function defs
  NeoBundle 'tacahiroy/ctrlp-funky'

  " A better JSON for Vim
  NeoBundle 'elzr/vim-json'

  NeoBundle 'Rykka/colorv.vim'
  NeoBundle 'gregsexton/MatchTag'
  NeoBundle 'chrisbra/NrrwRgn'
  NeoBundle 'mileszs/ack.vim'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'majutsushi/tagbar'
  NeoBundle 'vim-php/tagbar-phpctags.vim'
  NeoBundle 'terryma/vim-multiple-cursors'
  NeoBundle 'sukima/xmledit'

  " Vim plugin for Livedown.
  NeoBundle 'shime/vim-livedown'

  " Provides insert mode auto-completion for quotes, parens, brackets, etc.
  "NeoBundle 'Raimondi/delimitMate'

  " Auto close parentheses and repeat by dot dot dot...
  NeoBundle 'cohama/lexima.vim'

  " fugitive.vim: a Git wrapper so awesome
  NeoBundle 'tpope/vim-fugitive', {'augroup' : 'fugitive'}

  " surround.vim: quoting/parenthesizing made simple
  NeoBundle 'tpope/vim-surround'

  " wildfire: Smart selection of the closest text object.
  NeoBundle 'gcmt/wildfire.vim'

  " Up-to-date PHP syntax file (5.3, 5.4 & 5.5 support; basic 5.6 support)
  NeoBundle 'StanAngeloff/php.vim'

  " JavaScript
  NeoBundle 'pangloss/vim-javascript'

  " React JSX syntax highlighting and indenting for vim.
  NeoBundle 'mxw/vim-jsx'

  " html5
  NeoBundle 'othree/html5.vim'

  " css3 syntax
  NeoBundle 'hail2u/vim-css3-syntax'

  " dockerfile syntax
  NeoBundle 'honza/dockerfile.vim'

  " puppet syntax
  NeoBundle 'rodjek/vim-puppet'

  " Base16 Vim Colorschemes
  NeoBundle 'chriskempson/base16-vim'

  " github colorscheme
  NeoBundle 'harryxu/vim-github-colorscheme'

  " Solarized Colorscheme
  NeoBundle 'altercation/vim-colors-solarized'


call neobundle#end()

"filetype off
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


set modelines=1

if has('Win32')
    source $VIMRUNTIME/vimrc_example.vim
    "source $VIMRUNTIME/../vimfiles/mswin.vim
    behave mswin
else
    "runtime! debian.vim
    source $VIMRUNTIME/vimrc_example.vim
    if filereadable("/etc/vim/gvimrc.local")
        source /etc/vim/gvimrc.local
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Set to auto read when a file is changed from the outside
set autoread

"Have the mouse enabled all the time:
set mouse=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示行号
set nu

set cursorline

if !has('Win32')
    set list
    "set listchars=tab:·\ ,trail:·,eol:¬
    set listchars=tab:·\ ,trail:·
endif

set shiftround
set linebreak
let &showbreak='↪ '



" 横向滚动条
"set go+=b

set showcmd "show incomplete cmds down the bottom
set showmode "show current mode down the bottom

set ignorecase
set incsearch "find the next match as we type the search
set hlsearch "hilight searches by default
set smartcase

set wildmenu
set completeopt=longest,menuone
set splitbelow

set sessionoptions-=options

"set nowrap
" wrapping text
set wrap linebreak

set laststatus=2

" 默认禁用代码折叠
set nofoldenable
"选择代码折叠类型
"set foldmethod=syntax
"启动vim时不要自动折叠代码
set foldlevel=100

"hide menubar and toolbar
set go-=m
set go-=T

" toggle guioption
function! ToggleGO(flag)
    if &go =~# a:flag
        call feedkeys(":set go-=".a:flag."\<CR>")
    else
        call feedkeys(":set go+=".a:flag."\<CR>")
    endif
endfunction

set wildignore+=*.o,.git,.svn,*.jpg,*.gif,*.png,*.swf,*.psd,*.rar,*.zip,*.doc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fileformats
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 编码设定
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,gb2312,gb18030,cp936,default,latin1
if has('Win32')
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.UTF-8
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('Win32')
    set guifont=Inconsolata:h12
    set linespace=1
elseif has('mac')
    set guifont=PT\ Mono:h20
else
    set guifont=Courier\ Prime\ Code\ 17
    set gfw=WenQuanYi\Micro\Hei\ 12
    set linespace=2
endif

" 打开代码高亮
syntax enable

" Default Colorscheme
let g:solarized_menu=0
set background=dark
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 将F2键映射为取消字符串搜索后的高亮
map <F2> :nohlsearch<CR>

imap <F1> <ESC>
map <F1> <ESC>

" omni
" Add a C-p is for cancel select first item, this issue is cased by NeoComplCache.
imap <C-L> <C-x><C-o><C-p>

" 插入当前时间
:imap <C-D> <c-r>=strftime("<%Y-%m-%d %a %H:%M:%S>") . " harry"<CR>


" 打开文件即切换到文件所在目录
set autochdir

" ctrl s 保存
noremap <C-S>           :update<CR>
vnoremap <C-S>          <C-C>:update<CR>
inoremap <C-S>          <C-O>:update<CR>

" ctrl v 从剪切板中粘贴
cmap <C-V>              <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert>         <C-V>
vmap <S-Insert>         <C-V>

" Ctrl c 复制到剪切板
vnoremap <C-C> "+y

nmap j gj
nmap k gk

" move on windows
map <C-I> <C-W>k
map <C-J> <C-W>j
map <C-H> <C-W>h
map <C-L> <C-W>l

" windows move
set winaltkeys=no
map <A-k> <C-W>K
map <A-j> <C-W>J
map <A-h> <C-W>H
map <A-l> <C-W>L

if has('mac')
    "map <C-W> <C-^>
else
    map <A-1> <C-^>
endif

" Open the definition in a new tab
map <F5> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off
set nobackup
set nowb
set noswapfile

" Automatically removing all trailing whitespace
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
nmap ,cw :%s/\s\+$//e<CR><C-O>
autocmd FileType c,cpp,java,php,css,javascript,python autocmd BufWritePre <buffer> :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python virtualenv
" http://blag.felixhummel.de/vim/django_completion.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    """"""""""""""""""""""""""""""
    " tab
    """"""""""""""""""""""""""""""
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4

    """"""""""""""""""""""""""""""
    " indent
    """"""""""""""""""""""""""""""
    "Auto indent
    set ai

    "Smart indet
    set si

    "C-style indeting
    "set cindent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""
    " HTML related
    """"""""""""""""""""""""""""""

    """"""""""""""""""""""""""""""
    " Python
    """"""""""""""""""""""""""""""
    "autocmd FileType python set omnifunc=pythoncomplete#Complete

    """"""""""""""""""""""""""""""
    " PHP
    """"""""""""""""""""""""""""""
    "let php_sql_query = 1
    let php_alt_blocks = 0
    au FileType php imap ,, ->

    au BufRead *.blade.php setlocal ts=2 sts=2 sw=2

    " phpDocumentor
    "au FileType php nmap <C-S-P> :call PhpDocSingle()<CR>
    "let php_strict_blocks = 0

    """"""""""""""""""""""""""""""
    " XML
    """"""""""""""""""""""""""""""

    """"""""""""""""""""""""""""""
    " yaml,xml,html 使用2个空格作为缩进
    """"""""""""""""""""""""""""""
    autocmd FileType html,xhtml,htmldjango,css,scss,less,xml,jsp setlocal ts=2 sts=2 sw=2 expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    """"""""""""""""""""""""""""""
    " Tag list
    """"""""""""""""""""""""""""""
    let Tlist_Show_One_File=1
    let Tlist_Exit_OnlyWindow=1


    """"""""""""""""""""""""""""""
    " Tagbar
    """"""""""""""""""""""""""""""
    map <F4> :TagbarToggle<CR>
    imap <F4> <ESC>:TagbarToggle<CR>
    let g:tagbar_phpctags_bin='/Users/harry/workspace/utils/phpctags/phpctags'

    """"""""""""""""""""""""""""""
    " NERDTree
    """"""""""""""""""""""""""""""
    map <F3> <ESC>:NERDTreeToggle<CR>

    nmap ,g :NERDTreeFind<CR>

    let NERDTreeIgnore = ['\~$',
                \ '\.pyc$', '\.exe$', '\.dll$',
                \ '\.jpg$', '\.png$', '\.gif$',
                \ '\.swf$', '\.fla$', '\.o$',
                \ '\.tar.gz']

    """"""""""""""""""""""""""""""
    " xmledit
    """"""""""""""""""""""""""""""
    " jump to the beginning or end of the tag block
    au FileType xml,html,xhtml nmap <C-M> <LocalLeader>%

    """"""""""""""""""""""""""""""
    " miniBufExpl
    """"""""""""""""""""""""""""""
    let g:miniBufExplMapCTabSwitchBufs = 1

    """"""""""""""""""""""""""""""
    " => bufExplorer plugin
    """"""""""""""""""""""""""""""
    let g:bufExplorerDefaultHelp=0
    let g:bufExplorerShowRelativePath=1


    """"""""""""""""""""""""""""""
    " => Minibuffer plugin
    """"""""""""""""""""""""""""""
    let g:miniBufExplMaxSize = 1

    let g:bufExplorerSortBy = "name"


    """"""""""""""""""""""""""""""
    " => Zen Coding
    """"""""""""""""""""""""""""""
    let g:user_zen_settings = {
        \'indentation' : '  ',
    \}
    " use ctrl+k to expand zencoding code
    imap <silent> <C-k> <ESC>:call Expand_zen()<CR>
    vmap <C-k> <C-y>,
    fun Expand_zen()
        call feedkeys("\a")
        call feedkeys("\<C-y>,")
    endfun
    "let g:use_zen_complete_tag = 1

    """"""""""""""""""""""""""""""
    " => neocomplete
    """"""""""""""""""""""""""""""
    "Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1



    """"""""""""""""""""""""""""""
    " => Session manager
    """"""""""""""""""""""""""""""
    let g:session_autosave = 'yes'
    let g:session_menu = 0

    """"""""""""""""""""""""""""""
    " => ack.vim
    """"""""""""""""""""""""""""""
    "let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    let g:ackprg = 'ag --nogroup --nocolor --column'

    """"""""""""""""""""""""""""""
    " => ColorV
    """"""""""""""""""""""""""""""
    au! BufWinEnter *.css,*.less call colorv#preview("S")
    au! bufwritepost *.css,*.less call colorv#preview("S")

    """"""""""""""""""""""""""""""
    " => vim-easymotion
    """"""""""""""""""""""""""""""
    nmap ,w <leader><leader>w
    "nmap ,f <leader><leader>f

    """"""""""""""""""""""""""""""
    " => UltiSnips
    """"""""""""""""""""""""""""""
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

    """"""""""""""""""""""""""""""
    " => vim autoclose
    """"""""""""""""""""""""""""""
    let g:AutoClosePreserveDotReg = 0

    """"""""""""""""""""""""""""""
    " => Syntastic
    """"""""""""""""""""""""""""""
    let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_python_checkers = ['flake8']


    let g:syntastic_mode_map = {
        \ 'mode': 'active',
        \ 'active_filetypes': [],
        \ 'passive_filetypes': ['css', 'html']}


    """"""""""""""""""""""""""""""
    " => indentline
    """"""""""""""""""""""""""""""
    let g:indentLine_enabled = 0
    let g:indentLine_indentLevel = 5
    let g:indentLine_fileType = ['python']

    """"""""""""""""""""""""""""""
    " => AutoTag
    """"""""""""""""""""""""""""""
    let g:autotagLangConf = {
        \ 'php': { 'ctags_options': '--langmap=php:.engine.inc.module.theme.php' }
    \ }

    """"""""""""""""""""""""""""""
    " => Jedi
    """"""""""""""""""""""""""""""
    let g:jedi#popup_select_first = 0
    let g:jedi#auto_initialization = 1
    let g:jedi#popup_on_dot = 0
    let g:jedi#show_function_definition = "0"
    "autocmd  FileType python let b:did_ftplugin = 1

    """"""""""""""""""""""""""""""
    " => airline
    """"""""""""""""""""""""""""""
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_linecolumn_prefix = '¶ '
    let g:airline_branch_prefix = '⎇ '
    let g:airline_paste_symbol = 'ρ'
    let g:airline_whitespace_symbol = 'Ξ'

    " enable/disable fugitive/lawrencium integration
    let g:airline_enable_branch = 1

    " enable/disable syntastic integration
    let g:airline_enable_syntastic = 1

    " enable/disable tagbar integration
    let g:airline_enable_tagbar = 1

    """"""""""""""""""""""""""""""
    " => ctrlp and extensions
    """"""""""""""""""""""""""""""
    let g:ctrlp_extensions = ['funky']
    nmap ,f :CtrlPFunky<CR>

    """"""""""""""""""""""""""""""
    " => react jsx
    """"""""""""""""""""""""""""""
    let g:jsx_ext_required = 0
