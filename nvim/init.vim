"   __     __    _           _       _
"   \ \   / /_ _(_)_ __     | | ___ | | _____ _ __
"    \ \ / / _` | | '_ \ _  | |/ _ \| |/ / _ \ '__|
"     \ V / (_| | | | | | |_| | (_) |   <  __/ |
"      \_/ \__,_|_|_| |_|\___/ \___/|_|\_\___|_|
"
"
"设置默认文件编码为utf-8
set encoding=utf-8
set fileencoding=utf-8
"自动判断编码时，依次尝试以下编码
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030
"设置gvim字体
" set guifont=Noto Mono 14
"设置终端真彩色
set termguicolors
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
"高亮当前行
set cursorline
"高亮当前列
set cursorcolumn
"始终显示状态栏
set laststatus=2
"只在需要时重绘窗口
set lazyredraw    
"命令行补全参数
set wildmenu
"设置tab键空4格
set tabstop=4
"将Tab自动转化成空格(需要输入真正的Tab键时，使用<C-V>+Tab)，set noet快速关闭这个选项
set expandtab
"退格键一次删掉4个空格
set smarttab
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
set clipboard +=unnamed
noremap yy "+y
noremap pp "+p
"代码格式化
noremap == ggVG=<C-o>zz
"<F10>开启关闭粘贴模式
set pastetoggle=<F10>
" 通过索引快速跳转
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
"映射ESC
noremap nn <ESC>
"修改分屏快捷键
noremap zh <C-w>h
noremap zj <C-W>j
noremap zk <C-w>k
noremap zl <C-w>l
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
"Ctrl+t新建标签页
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>
"快捷缩进
vnoremap < <v
vnoremap > >v
"打开一个文件自动定位到上一次退出时的位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"设置状态栏显示的内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}


source ~/MyVim/base.vim
source ~/MyVim/plugin.vim
