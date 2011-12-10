set nocompatible    "不要使用vi的键盘模式，而是vim自己的(命令模式下TAB补全)
filetype plugin on  "载入文件类型插件
filetype on         "侦测文件类型
syntax on           "enable colors

"display settings
"""""""""""""""""""""""""""""""""""""""""
colo desert
set bg=dark
set nu              "show cursor position in status bar
set ruler           "Always show current position
set showcmd	    	"show typed command in status bar
set showmode        "Show editing mode
set showmatch       "高亮显示匹配的括号 
set title	    	"show file in titlebar
set wildmenu        "Show possible command when perssing<TAB>
set scrolloff=3     "光标移到buffer的顶部和底部保存3行距离
"set laststatus=2    " 始终显示状态行

set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P]              "设置状态栏的信息

func! GetPWD()
     return substitute(getcwd(), "", "", "g")
endf"

"editor settings
"""""""""""""""""""""""""""""""""""""""""
set incsearch       "Search as you type
set ignorecase      "Ignore case when searching
set hlsearch        "Hightlight search things
set smartindent     "smart auto indenting
set smarttab	     "smart tab handling for indenting
"set magic	         "change the way backslashes are used in search patterns
set matchpairs=(:),{:},[:],<:>
set autoread        "Set to auto read when a file is changed from the outside
set nobackup        "Turn backup off,no backup ~ files.
set foldenable
set keywordprg=sdcv "sdcv 按K翻译当前单词
set nolinebreak
setlocal noswapfile "no swapfile

"定义W命令，允许以root权限保存文件
command W w !sudo tee % > /dev/null

"misc settings
"""""""""""""""""""""""""""""""""""""""""
set hidden          "remember undo after quitting
set history=400     "Sets how many lines of history VIM to remember
set mouse=a
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,gb2312,gb18030,cp936

set shiftwidth=4
set tabstop=4
set softtabstop=4       "replay <Tab>with 4 blank space
"set expandtab

runtime! ftplugin/man.vim  "Man 3 ctime , \K

if has("autocmd")
	"打开文件时，总是跳到退出之前的光标处
	autocmd BufReadPost *
	    \ if line("'\"") > 0 && line("'\"") <= line("$") |
	    \   exe "normal! g`\"" |
	    \ endif

    autocmd FileType python,c,cpp,javascript setlocal ts=4 sts=4 sw=4 expandtab
	"将指定文件的换行符转换成 UNIX 格式
    autocmd FileType php,javascript,html,css,python,vim,vimwiki set ff=unix
endif

"Bash like
nmap    <C-A>   <Home>
imap    <C-A>   <Home>
nmap    <C-E>   <End>
imap    <C-E>   <End>

"Move in insert mode
imap   <M-k>   <Up>
imap   <M-j>   <Down>
imap   <M-h>   <Left>
imap   <M-l>   <Right>

"Tab navigation
nmap    <C-t>   :tabnew<CR>
nmap    <C-p>   :tabprevious<CR>
nmap    <C-n>   :tabnext<CR>
nmap    <C-k>   :tabclose<CR>
nmap    <C-Tab> :tabnext<CR>

"折叠的键映射
noremap <M-z> zc
noremap <M-x> zO
inoremap <M-z> <C-o>zc
inoremap <M-x> <C-o>zO

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
	exec "!clear"
	exec "!python %"
endfunc


"plugin setting
"""""""""""""""""""""""""""""""""""""""""
"NERDTree""""""
map     <F4>    :NERDTree<CR>

"Vimwiki"""""""
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
