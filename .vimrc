set nocompatible
filetype plugin on
syntax on


set nu              "Show line number
set ruler           "Always show current position

set incsearch       "Search as you type
set ignorecase      "Ignore case when searching
set hlsearch        "Hightlight search things

set wildmenu        "Show possible command when perssing<TAB>
set showmode        "Show editing mode

set history=400     "Sets how many lines of history VIM to remember

set autoread        "Set to auto read when a file is changed from the outside

set nobackup        "Turn backup off
setlocal noswapfile "no swapfile


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
nmap    <C-d>   :tabclose<CR>
nmap    <C-j>   :tabprevious<CR>
nmap    <C-k>   :tabnext<CR>

"打开文件时，总是跳到退出之前的光标处
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"Vimwiki setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7>    :Vimwiki2HTML<CR>
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
