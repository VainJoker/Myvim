"   __     __    _           _       _
"   \ \   / /_ _(_)_ __     | | ___ | | _____ _ __
"    \ \ / / _` | | '_ \ _  | |/ _ \| |/ / _ \ '__|
"     \ V / (_| | | | | | |_| | (_) |   <  __/ |
"      \_/ \__,_|_|_| |_|\___/ \___/|_|\_\___|_|
"
"


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
        call setline(2,"")
    endif
endfunc 
autocmd BufNewFile * normal G


"一键运行代码
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %<"
        exec "!time java %"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!google-chrome-stable % &"
    elseif &filetype == 'go'
        exec "!go build % "
        exec "!time ./%<"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!google-chrome %.html &"
    elseif &filetype == 'tex'
        exec "!xelatex %"
    endif
endfunc

"f6调试
map <F6> :call Debugrun()<CR>
func! Debugrun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'go'
        exec ":terminal dlv debug "
    elseif &filetype == 'tex'
        exec ":LLPStartPreview"
    endif
endfunc

