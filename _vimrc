"   __     __    _           _       _
"   \ \   / /_ _(_)_ __     | | ___ | | _____ _ __
"    \ \ / / _` | | '_ \ _  | |/ _ \| |/ / _ \ '__|
"     \ V / (_| | | | | | |_| | (_) |   <  __/ |
"      \_/ \__,_|_|_| |_|\___/ \___/|_|\_\___|_|
"

"设置默认文件编码为utf-8
set encoding=utf-8
set fileencoding=utf-8
"自动判断编码时，依次尝试以下编码
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030
"设置字体为Source Code Pro
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 3
set guifont=Powerline\ Consolas\ 13
" set guifont=Noto Mono 14
"设置终端真彩色
" set termguicolors
"显示匹配括号
set showmatch
"修改Leader键为空格键
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
"设置backspace行为
set backspace=indent,eol,start 
"显示行号
set number
"显示相对行号
set relativenumber
"显示标尺
set ruler
"关闭自动备份
set nobackup
set noswapfile
"不保存交换文件 
set updatecount=0 
"在未保存时允许切换缓冲区
set hidden 
"开启语法高亮
syntax enable
syntax on
"关闭兼容模式
set nocompatible
"高亮当前行
set cursorline
"高亮当前列
set cursorcolumn
"始终显示状态栏
set laststatus=2
"只在需要时重绘窗口
set lazyredraw    
"使屏幕显示更流畅
set ttyfast
"命令行补全参数
set wildmenu
"让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"设置tab键空4格
set tabstop=4
"将Tab自动转化成空格(需要输入真正的Tab键时，使用<C-V>+Tab)，set noet快速关闭这个选项
set expandtab
"退格键一次删掉4个空格
set smarttab
"leader设为空格
let mapleader = "\<space>"
"可视化不可见字符
set listchars=tab:▸\ ,trail:¬,extends:>,precedes:<
set nolist
"实时搜索
set incsearch
"高亮搜索结果,:noh取消高亮
set hlsearch
"忽略大小写
set ignorecase
"有一个或以上大写字母时仍大小写敏感
set smartcase
"打开正则表达式
set magic
"搜索模式为默认更先进的正则规则
nnoremap / /\v
vnoremap / /\v
"设置忽略的文件
set wildignore=*.o,*.swp,*.bak,*.pyc,*.pyo,*.class,*.zip
set wildignore+=*/.git/*
"显示匹配的括号
set showmatch
"显示当前所处模式
set showmode
"设置右下角显示当前光标位置
set showcmd
"设置当文件被改动时自动载入
set autoread
"当前目录随着被编辑文件的改变而改变
set autochdir
"允许插件  
filetype plugin on
"共享剪贴板  
set clipboard+=unnamed
vmap yy "+y"
"代码格式化
noremap == ggVG=<C-o>zz
"<F10>开启关闭粘贴模式
set pastetoggle=<F10>
"无权限写入
noremap <C-w> :w! sudo tee %<CR>
"<C-hjkl>映射
map <C-l> <NOP>
imap <C-l> <ESC>
noremap <C-k> :w
nnoremap <C-h> 0
noremap <C-l> $
"修改分屏快捷键
noremap <leader>h <C-w>h
noremap <leader>j <C-W>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
"RR添加<++>占位内容,rr修改<++>占位内容
noremap rr <NOP>
noremap RR a<++><Esc>
noremap rr <Esc>/<++><CR>:nohlsearch<CR>c4l
"关闭输入错误的提示声音
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"禁止光标闪烁
set gcr=a:block-blinkon0
"在处理未保存或只读文件的时候，弹出确认
set confirm
"上下移动光标时光标上方和下方至少保留八行
set scrolloff=8
"开启自动缩进，智能缩进
set autoindent
set cindent
set smartindent
set shiftwidth=4
"为特定文件类型载入相关缩进文件
filetype indent on
"自动检测文件类型
filetype plugin indent on
"设置显示消息的列数
set cmdheight=2
"隐藏工具栏
set guioptions-=T
"Ctrl+T新建标签页
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>
"快捷缩进
vnoremap < <v
vnoremap > >v
"禁止通过方向键进行移动
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>
noremap <UP> <NOP>
noremap <DOWN> <NOP>
"打开一个文件自动定位到上一次退出时的位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" "保留代码折叠
" autocmd BufWinLeave * mkview
" autocmd BufWinEnter * loadview
"设置状态栏显示的内容
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"输入法滞留
let g:input_toggle = 0
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction
function! Fcitx2zh()
    let s:input_status = system("fcitx-remote")
    if s:input_status != 2 && g:input_toggle == 1
        let l:a = system("fcitx-remote -o")
        let g:input_toggle = 0
    endif
endfunction
autocmd InsertLeave * call Fcitx2en()
autocmd InsertEnter * call Fcitx2zh()
"自动插入文件头
autocmd BufNewFile *.html,*.cpp,*.c,*.sh,*.py exec ":call SetHeader()" 
func! SetHeader() 
    if expand("%:e") == 'sh'
        call setline(1,"#!/usr/bin/bash")
    elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python3")
        call setline(2,"import ipdb")
        call setline(3,"")
    elseif expand("%:e") == 'cpp' 
        call setline(1,"#include <iostream>") 
        call setline(2,"")
        call setline(3,"using std::cin;") 
        call setline(4,"using std::cout;") 
        call setline(5,"using std::endl;") 
        call setline(6,"")
    elseif expand("%:e") == 'c'
        call setline(1,"#include <stdio.h>") 
        call setline(2,"#include <stdlib.h>")
        call setline(3,"")
    endif
endfunc 
autocmd BufNewFile * normal G
"一键运行代码
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %"
        exec "!time ./%"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %"
        exec "!time ./%"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!google-chrome-stable % &"
    elseif &filetype == 'go'
        exec "!go build % "
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!google-chrome %.html &"
    endif
endfunc


"插件配置

"文件树
" 目录树窗口尺寸
let g:NERDTreeWinSize = 20
" 关闭nerd帮助
" let g:NERDTreeMinimalUI = 1
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
" 显示隐藏文件
let NERDTreeShowHidden=1
" 修改默认箭头符号
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" <F2>打开关闭NERDTree
map <F2> :NERDTreeToggle<CR>
augroup NERDTree
    au!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    " 文件全部关闭时退出NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END


"undotree
"<F9> 打开关闭undotree
map <F9> :UndotreeToggle <cr>
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup
set directory=~/.config/nvim/tmp/backup
if has("persistent_undo")
    set undofile
    set undodir=~/.config/nvim/tmp/undo
endif


"F3打开tagbar
nmap <F3> :TagbarToggle<CR>


"LaTex插件
"let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'

"文件头信息
let g:file_copyright_name = "VainJoker"
let g:file_copyright_email = "vainjoker@163.com"
let g:file_copyright_auto_filetypes = ['sh', 'plx', 'pl', 'pm', 'py', 'python', 'h', 'hpp', 'c', 'cpp', 'java']

"vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"golang优化
let g:ale_linters = {
            \ 'go': ['gopls'],
            \}


"延时启动
let g:coc_start_at_startup=0
function! CocTimerStart(timer)
    exec "CocStart"
endfunction
call timer_start(500,'CocTimerStart',{'repeat':1})
let g:coc_global_extensions = ['coc-marketplace','coc-python','coc-vimlsp','coc-snippets','coc-emmet','coc-html','coc-json','coc-css','coc-tsserver','coc-yank','coc-lists','coc-highlight','coc-pairs']
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
source ~/.config/coc/coc.conf

"彩虹括号
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
            \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \	'ctermfgs': ['lightblue', 'lightyellow', 'lightred','lightcyan', 'lightmagenta'],
            \	'operators': '_,_',
            \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \	'separately': {
            \		'*': {},
            \		'tex': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \		},
            \		'lisp': {
            \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \		},
            \		'vim': {
            \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \		},
            \		'html': {
            \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \		},
            \		'css': 0,
            \	}
            \}

"markdown 预览
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1
" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1
" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0
" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0
" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''
" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'google-chrome-stable'
" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0
" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {}
            \ }
" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''
" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''
" use a custom port to start server or random for empty
let g:mkdp_port = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
source ~/.config/coc/ultisnips/markdown.snippets

"状态栏
let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'fugitive#head'
            \ },
            \ }
let g:bufferline_echo = 1
let g:bufferline_active_buffer_right = ']'
let g:bufferline_modified = '+'
let g:bufferline_show_bufnr = 1
let g:bufferline_solo_highlight = 0


"代码注释
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


"leaderf 文件查找
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"Leetcode
nnoremap <leader>ll :LeetCodeList<cr>
nnoremap <leader>lt :LeetCodeTest<cr>
nnoremap <leader>ls :LeetCodeSubmit<cr>
nnoremap <leader>li :LeetCodeSignIn<cr>
let g:leetcode_solution_filetype="c"
let g:leetcode_browser = "chrome"
let g:leetcode_cookie_path='/home/vainjoker/.config/google-chrome/System Profile/Cookies'

let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector


let g:HicusLineEnabled = 1
let g:HicusLineMode = {
\   'n':      'NORMAL',
\   'i':      'INSERT',
\   'R':      'REPLACE',
\   'v':      'VISUAL',
\   'V':      'L-VIS',
\   "\<C-v>": 'B-VIS',
\   'c':      'COMMAND',
\   's':      'SELECT',
\   'S':      'L-SEL',
\   "\<C-s>": 'B-SEL',
\   't':      'TERMINAL',
\}



call plug#begin('~/.vim/plugged')
" "copyright
Plug 'nine2/vim-copyright'
Plug 'ianding1/leetcode.vim',{'on':'LeetCodeSignIn'}
" " format
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
" Plug 'Yggdroot/indentLine'
"code completion
" Plug 'neovim/nvim-lsp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim',{'for':'html,css,js'}
Plug 'othree/html5.vim',{'for':'html,css,js'}
Plug 'pangloss/vim-javascript',{'for':'html,css,js'}
" Plug 'shawncplus/phpcomplete.vim'
" Plug 'spf13/PIV'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'honza/vim-snippets'
"moving method
Plug 'Lokaltog/vim-easymotion'
"orgmode
"Plug 'jceb/vim-orgmode'
"markdown latex
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'dhruvasagar/vim-table-mode',{'for':'markdown'}
"Plug 'lervag/vimtex'
"tagbar
Plug 'majutsushi/tagbar',{'on':'TagbarToggle'}
"quotes,parens
Plug 'luochen1990/rainbow'
"code comment
Plug 'scrooloose/nerdcommenter'
"version manager
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree',{'on':'UndotreeToggle'}
"file manager
Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}
Plug 'Yggdroot/LeaderF'
Plug '~/.fzf'
"interface
Plug 'mhinz/vim-startify'
"statusline
" Plug 'vim-airline/vim-airline'
" Plug 'itchyny/lightline.vim'
Plug 'bling/vim-bufferline'
" colorscheme
Plug 'morhetz/gruvbox'
" Plug 'lifepillar/vim-solarized8'
" Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'SpringHan/lightTodo.vim'
" Plug 'Styadev/HicusLine'
call plug#end()

"配色
set background=dark
" colorscheme dracula
colorscheme gruvbox
" colorscheme solarized8_high


function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return '⚡'
  endif
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif
  if bytes <= 0
    return '0'
  endif
  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction


function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return '✔'
  endif
endfunction


" set statusline=
" set statusline+=%{ReadOnly()}                            " Writeable
" set statusline+=\ %n\           " buffer number
" set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
" set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
" set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
" set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
" set statusline+=%#Visual#       " colour
" set statusline+=%{&paste?'\ PASTE\ ':''}
" set statusline+=%{&spell?'\ SPELL\ ':''}
" set statusline+=%#CursorIM#     " colour
" set statusline+=%R                        " readonly flag
" set statusline+=%M                        " modified [+] flag
" set statusline+=%#Cursor#               " colour
" set statusline+=%#CursorLine#     " colour
" set statusline+=%.20F
" set statusline+=%=                          " right align
" set statusline+=%{FileSize()}
" set statusline+=%#CursorLine#   " colour
" set statusline+=\ %Y\                   " file type
" set statusline+=%{GitInfo()}                        " Git Branch name
" set statusline+=%#CursorIM#     " colour
" set statusline+=\ %3l:%-2c\         " line + column
" set statusline+=%#Cursor#       " colour
" set statusline+=\ %3p%%\                " percentage
"
"
"
