if &compatible
    set nocompatible
endif

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

    " ddc plugins start
    Plug 'Shougo/ddc.vim'
    Plug 'Shougo/ddc-matcher_head'
    Plug 'Shougo/ddc-sorter_rank'
    Plug 'Shougo/pum.vim'
    Plug 'Shougo/ddc-omni'
    Plug 'vim-denops/denops.vim'
    Plug 'octaltree/cmp-look'
    Plug 'tani/ddc-path'
    " ddc plugins end

    Plug 'junegunn/fzf'

    " Extended f, F, t and T key mappings for Vim.
    Plug 'rhysd/clever-f.vim'

    " comment stuff out
    Plug 'tpope/vim-commentary'

    " Tern plugin for Vim
    Plug 'marijnh/tern_for_vim'

    Plug 'scrooloose/nerdtree'

    if has('nvim')
        " A File Explorer For Neovim Written In Lua, https://github.com/kyazdani42/nvim-tree.lua
        Plug 'kyazdani42/nvim-web-devicons'
        Plug 'kyazdani42/nvim-tree.lua'
        Plug 'romgrk/barbar.nvim'
    endif

    " Make your Vim/Neovim as smart as VSCode.
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'scrooloose/syntastic'

    " Codeium
    Plug 'Exafunction/codeium.vim'

    Plug 'editorconfig/editorconfig-vim'

    " UltiSnips
    Plug 'SirVer/ultisnips'

    Plug 'honza/vim-snippets'

    " EasyMotion
    Plug 'Lokaltog/vim-easymotion'

    " airline
    Plug 'bling/vim-airline'

    " session
    Plug 'xolox/vim-session'

    Plug 'xolox/vim-misc'

    " A better JSON for Vim
    Plug 'elzr/vim-json'

    Plug 'chrisbra/NrrwRgn'

    Plug 'mileszs/ack.vim'

    Plug 'mattn/emmet-vim'

    Plug 'airblade/vim-gitgutter'

    Plug 'plasticboy/vim-markdown'

    Plug 'majutsushi/tagbar'

    Plug 'terryma/vim-multiple-cursors'

    Plug 'sukima/xmledit'

    " A Vim plugin for writing JSON with JSON Schema
    Plug 'Quramy/vison'

    " vim plugin for tmux.conf
    Plug 'tmux-plugins/vim-tmux'

    " Auto close parentheses and repeat by dot dot dot...
    Plug 'cohama/lexima.vim'

    " fugitive.vim: a Git wrapper so awesome
    Plug 'tpope/vim-fugitive'

    " surround.vim: quoting/parenthesizing made simple
    Plug 'tpope/vim-surround'

    " wildfire: Smart selection of the closest text object.
    Plug 'gcmt/wildfire.vim'

    " Go development plugin for Vim
    Plug 'fatih/vim-go'

    Plug 'vim-scripts/xterm16.vim'

    " Up-to-date PHP syntax file (5.3, 5.4 & 5.5 support; basic 5.6 support)
    Plug 'StanAngeloff/php.vim'

    " JavaScript
    Plug 'pangloss/vim-javascript'

    " React JSX syntax highlighting and indenting for vim.
    Plug 'mxw/vim-jsx'

    " html5
    Plug 'othree/html5.vim'

    " css3 syntax
    Plug 'hail2u/vim-css3-syntax'

    " A very fast, multi-syntax context-sensitive color name highlighter
    Plug 'ap/vim-css-color'

    " dockerfile syntax
    Plug 'honza/dockerfile.vim'

    " Seamless navigation between tmux panes and vim splits
    Plug 'christoomey/vim-tmux-navigator'


    " color themes
    Plug 'mkarmona/colorsbox'
    Plug 'morhetz/gruvbox'
    Plug 'romainl/Apprentice'
    Plug 'EdenEast/nightfox.nvim'

call plug#end()

let g:deoplete#enable_at_startup = 1



"filetype off
filetype plugin indent on


set modelines=1

if has('Win32')
    source $VIMRUNTIME/vimrc_example.vim
    "source $VIMRUNTIME/../vimfiles/mswin.vim
    behave mswin
else
    "runtime! debian.vim
    if filereadable("$VIMRUNTIME/vimrc_example.vim")
        source $VIMRUNTIME/vimrc_example.vim
    endif
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
" if &term =~ '^screen'
"     " tmux knows the extended mouse mode
"     set ttymouse=xterm2
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示行号
set nu

set cursorline

set shiftround
set linebreak
let &showbreak='↪ '

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
" 打开代码高亮
syntax enable

" Default Colorscheme
set background=dark


set guifont=Iosevka\ Curly\ Slab:h21

if has('gui_running') || has('gui_vimr')
    colorscheme nordfox
    "colorscheme apprentice
else
    "colorscheme colorsbox-steighties
    colorscheme nordfox
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 将F2键映射为取消字符串搜索后的高亮
map <F2> :nohlsearch<CR>

imap <F1> <ESC>
map <F1> <ESC>

" omni
imap <C-L> <C-x><C-o><C-p>

" 插入当前时间
:imap <C-D> <c-r>=strftime("<%Y-%m-%d %a %H:%M:%S>") . " harry"<CR>


" 打开文件即切换到文件所在目录
set autochdir

" ctrl/command s 保存
noremap <C-s>           :update<CR>
vnoremap <C-s>          <C-C>:update<CR>
inoremap <C-s>          <C-O>:update<CR>

noremap <D-s>           :update<CR>
vnoremap <D-s>          <C-C>:update<CR>
inoremap <D-l>          <C-O>:update<CR>

" ctrl/command v 从剪切板中粘贴
cmap <C-v>              <C-R>+
cmap <D-v>              <C-R>+
imap <D-v>              <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
imap <S-Insert>         <C-V>
vmap <S-Insert>         <C-V>

" ctrl/command c 复制到剪切板
vnoremap <C-c> "+y
vnoremap <D-c> "+y

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
    " NvimTree / NERDTree
    """"""""""""""""""""""""""""""
    if has('nvim')
lua << EOF
    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup()
EOF
        map <F3> <ESC>:NvimTreeToggle<CR>
    else
        map <F3> <ESC>:NERDTreeToggle<CR>
    endif

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

    " fzf search project root
    fun! s:fzf_root()
        let path = finddir(".git", expand("%:p:h").";")
        return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
    endfun


    nnoremap <C-p> :exe 'FZF ' . <SID>fzf_root()<CR>

    """"""""""""""""""""""""""""""
    " => Session manager
    """"""""""""""""""""""""""""""
    let g:session_autosave = 'yes'
    let g:session_autoload = 'no'
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
    " => coc.nvim
    """"""""""""""""""""""""""""""
    source $HOME/.config/nvim/plug-config/coc.vim


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

    " react jsx
    let g:jsx_ext_required = 0

    " json
    let g:vim_json_syntax_conceal = 0

    " ddc.vim
    " call ddc#custom#patch_global({
    "         \ 'ignoreCase': v:true,
    "     \})
    call ddc#custom#patch_global('sources', ['omni', 'path', 'look'])
    call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
            \   'matchers': ['matcher_head'],
            \   'sorters': ['sorter_rank'],
            \ },
            \ 'look': {'converters': ['loud', 'matcher_head'], 'matchers': [], 'mark': 'l', 'isVolatile': v:true},
            \ 'omni': {'mark': 'O'},
        \ })
    call ddc#custom#patch_global('sourceParams', {
            \ 'look': {
            \   'convertCase': v:true,
            \   'dict': v:null
            \ },
            \ 'path': {
            \   'cmd': ['fd', '--max-depth', '5'],
            \ },
        \})

	" <TAB>: completion.
	inoremap <silent><expr> <TAB>
	\ pumvisible() ? '<C-n>' :
	\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
	\ '<TAB>' : ddc#map#manual_complete()

	" <S-TAB>: completion back.
	inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'


    call ddc#enable()


