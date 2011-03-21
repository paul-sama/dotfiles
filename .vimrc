set nocompatible    " 不要使用vi的键盘模式，而是vim自己的
filetype plugin on  " 载入文件类型插件
syntax on           "语法高亮
filetype on         "侦测文件类型


set nu              "Show line number
set ruler           "Always show current position

set incsearch       "Search as you type
set ignorecase      "Ignore case when searching
set hlsearch        "Hightlight search things
"set showmatch      "高亮显示匹配的括号 
"set matchtiem=2    "匹配搜索高亮的时间(单位十分之一秒)

set wildmenu        "Show possible command when perssing<TAB>
set showmode        "Show editing mode

set history=400     "Sets how many lines of history VIM to remember

set autoread        "Set to auto read when a file is changed from the outside

set nobackup        "Turn backup off
setlocal noswapfile "no swapfile

set foldenable

set scrolloff=3     "光标移到buffer的顶部和底部保存3行距离

set keywordprg=sdcv "sdcv 按K翻译当前单词

colo desert

set bg=dark
set mouse=a

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,gb2312,gb18030,cp936

set shiftwidth=4
set softtabstop=4       "replay <Tab>with 4 blank space
set tabstop=4
set smarttab
set expandtab

set nolinebreak

"Bash like
nmap    <C-A>   <Home>
imap    <C-A>   <Home>
nmap    <C-E>   <End>
imap    <C-E>   <End>

"Move in insert mode
imap    <M-k>   <Up>
imap    <M-j>   <Down>
imap    <M-h>   <Left>
imap    <M-l>   <Right>
imap    <M-u>   <C-Left>

"Tab navigation
nmap    <C-t>   :tabnew<CR>
"nmap    <C-d>   :tabclose<CR>
nmap    <C-j>   :tabprevious<CR>
nmap    <C-k>   :tabnext<CR>

"折叠的键映射
noremap <M-z> zc
noremap <M-x> zO
inoremap <M-z> <C-o>zc
inoremap <M-x> <C-o>zO


"定义W命令，允许以root权限保存文件
command W w !sudo tee % > /dev/null

"在当前文件路径打开终端
noremap <F3> :!xterm -e bash -c "cd %:p:h;bash" &<CR> | :redraw!
inoremap <F3> <C-o>:!xterm -e bash -c "cd %:p:h;bash" &<CR> | :redraw!

"打开文件时，总是跳到退出之前的光标处
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif


map     <F4>    :NERDTree<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %<"
    exec "! ./%<"
endfunc

map  <F6> :call CRPython()<CR>
imap <F6> <ESC> :call CRPython()<CR>
vmap <F6> <ESC> :call CRPython()<CR>
func! CRPython()
	exec "w"
	exec "!python %"
endfunc

"map  <F5> :call CRJava()<CR>
"imap <F5> <ESC> :call CRJava ()<CR>
"vmap <F5> <ESC> :call CRJava()<CR>
"func! CRJava()
"	exec "w"
"	exec "!javac %"
"	exec "!java %<"
"endfunc


"Vimwiki setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F7>    :w<CR>:Vimwiki2HTML<CR>
imap <F7>    <Esc>:w<CR>:Vimwiki2HTML<CR>
"map <F8>    :VimwikiAll2HTML<CR>

let g:vimwiki_list = [{'path': '~/vimwiki/', 'auto_export': 1}]
let g:vimwiki_camel_case = 0

let g:vimwiki_list = [{'path': '~/vimwiki/',
		\ 'path_html': '~/vimwiki/html/',
		\ 'html_header': '~/vimwiki/html/header.tpl',
		\ 'html_footer': '~/vimwiki/html/footer.tpl'},
		\ {'path': '~/wiki/',
		\ 'path_html': '~/wiki/html/',
		\ 'html_header': '~/wiki/html/header.tpl',
		\ 'html_footer': '~/wiki/html/footer.tpl'}
		\ ]

"autocmd BufNewFile *.py source ~/.vim/ftplugin/pythonheader.vim
"autocmd BufNewFile *.py 0put=\"#!/usr/bin/env python\<nl># -*- coding: UTF-8 -*-\<nl>\"

"autocmd BufNewFile *.py
"            \0put=\"#!/usr/bin/python\<nl># -*- coding: UTF-8 -*-\<nl>\"




" 能够漂亮地显示.NFO文件
" set encoding=utf-8
" function! SetFileEncodings(encodings)
"     let b:myfileencodingsbak=&fileencodings
"     let &fileencodings=a:encodings
"endfunction
"function! RestoreFileEncodings()
"     let &fileencodings=b:myfileencodingsbak
"     unlet b:myfileencodingsbak
"endfunction
"
"au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
"au BufReadPost *.nfo call RestoreFileEncodings()
