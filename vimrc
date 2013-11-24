"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

" pathogen
call pathogen#runtime_append_all_bundles("addons")
"call pathogen#helptags()

filetype off
filetype plugin indent on

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

"statusline setup
set statusline=%f "tail of the filename

"display a warning if fileformat isnt unix
set statusline+=\ [%{&ff}]

"display file encoding
set statusline+=[%{&fenc}]

set statusline+=%h "help file flag
set statusline+=%y "filetype
set statusline+=%r "read only flag
set statusline+=%m "modified flag

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*


set statusline+=%= "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c, "cursor column
set statusline+=\ %l/%L "cursor line/total lines
set statusline+=\ %P "percent through file
set laststatus=2

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

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

" toggle menubar
nmap ,m :call ToggleGO('m')<CR>


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
    " 代码字体和大小
    "set guifont=YaHei_Consolas_Hybrid:h10.5
    "set guifont=Bitstream_Vera_Sans_Mono:h11
    set guifont=Inconsolata:h12
    set linespace=1
elseif has('mac')
    set guifont=Menlo:h15
else
    "set guifont=Consolas\ Bold\ 13
    "set guifont=Consolas\ 13
    "set guifont=Monaco\ Bold\ 11
    "set guifont=Monaco\ 10
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ Bold\ 12
    "set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
    set guifont=Inconsolata\ 14
    "set guifont=Inconsolata\ for\ Powerline\ 13
    "set guifont=Anonymous\ Pro\ Bold\ 12
    "set guifont=DejaVu\ Sans\ Mono\ 11
    set gfw=WenQuanYi\Micro\Hei\ 12
    "set gfw=WenQuanYi\Zen\Hei\ 11
    set linespace=2
endif

" 打开代码高亮
syntax enable

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_bold=0    "default value is 1
let g:solarized_contrast="high"    "default value is normal
syntax enable
set background=dark
colorscheme solarized
highlight clear SignColumn
autocmd ColorScheme * highlight clear SignColumn


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
    " diff
    """"""""""""""""""""""""""""""
    au FileType diff colorscheme railscasts

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

    " ctags
    set tags=./tags;/
    au FileType php set tags+=~/workspace/www/d/tags

    """"""""""""""""""""""""""""""
    " NERDTree
    """"""""""""""""""""""""""""""
    map <F3> <ESC>:NERDTreeToggle<CR>
    let NERDTreeIgnore = ['\~$',
                \ '\.pyc$', '\.exe$', '\.dll$',
                \ '\.jpg$', '\.png$', '\.gif$',
                \ '\.swf$', '\.fla$', '\.o$',
                \ '\.tar.gz']

    """"""""""""""""""""""""""""""
    " NERDCommenter
    """"""""""""""""""""""""""""""
    nmap ,cc <leader>cc
    vmap ,cc <leader>cc
    nmap ,c<space> <leader>c<space>
    vmap ,c<space> <leader>c<space>

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
    " => NeoComplCache
    """"""""""""""""""""""""""""""
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 0
    "au FileType markdown,text,gitcommit,php,css,html NeoComplCacheEnable
    " Use smartcase.
    let g:NeoComplCache_SmartCase = 1
    let g:neocomplcache_caching_limit_file_size = 50000000
    if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
    endif
    "let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'

    "let g:neocomplcache_force_omni_patterns.php = '[^. *\t]\.\w*\|\h\w*::'

    "let g:neocomplcache_disable_auto_complete = 1

    "Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1



    """"""""""""""""""""""""""""""
    " => Session manager
    """"""""""""""""""""""""""""""
    let g:session_autosave = 'yes'

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
    nmap ,f <leader><leader>f

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
    " => vim statline
    """"""""""""""""""""""""""""""
    let g:statline_fugitive = 1

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
    " => YouCompleteMe
    """"""""""""""""""""""""""""""
    let g:ycm_key_list_select_completion = ['<Down>']
    let g:ycm_key_list_previous_completion = ['<Up>']
    let g:ycm_semantic_triggers =  {
        \   'c' : ['->', '.'],
        \   'objc' : ['->', '.'],
        \   'ocaml' : ['.', '#'],
        \   'cpp,objcpp' : ['->', '.', '::'],
        \   'perl' : ['->'],
        \   'php' : [],
        \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
        \   'ruby' : ['.', '::'],
        \   'lua' : ['.', ':'],
        \   'erlang' : [':'],
        \ }
    "let g:ycm_filetype_whitelist = { 'python': 1 }
    let g:ycm_filetype_blacklist = {
      \ 'markdown' : 1,
      \ 'text' : 1,
      \ 'gitcommit' : 1,
      \ 'css' : 1,
      \ 'html' : 1,
      \ 'php' : 1,
      \}


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
