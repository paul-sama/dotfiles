set nocompatible
filetype plugin on
syntax on

"Show line number
set nu
"Always show current position
set ruler

"Search as you type
set incsearch
"Ignore case when searching
set ignorecase
"Hightlight search things
set hlsearch

"Show possible command when perssing<TAB>
set wildmenu

"Show editing mode
set showmode

"Sets how many lines of history VIM to remember
set history=400

"Set to auto read when a file is changed from the outside
set autoread

"Turn backup off
set nobackup
setlocal noswapfile


"光标移到buffer的顶部和底部保存3行距离
set scrolloff=3

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
nmap <C-A>      <Home>
imap <C-A>      <Home>
nmap <C-E>      <End>
imap <C-E>      <End>

"Move in insert mode
imap    <M-k>    <Up>
imap    <M-j>    <Down>
imap    <M-h>    <Left>
imap    <M-l>    <Right>
imap    <M-u>    <C-Left>

"Tab navigation
nmap <S-t>  :tabnew<CR>
nmap <S-d>  :tabclose<CR>
nmap <C-j>  :tabprevious<CR>
nmap <C-k>  :tabnext<CR>

imap (		()<ESC>i
imap {		{}<ESC>i
imap [		[]<ESC>i
imap <		<><ESC>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F7> :call VimwikiSave()<CR>
imap <F7> <ESC> :call VimwikiSave()<CR>
vmap <F7> <ESC> :call VimwikiSave()<CR>
func! VimwikiSave()
	exec "w"
	exec "Vimwiki2HTML"
endfunc

map <F8> :call VimwikiAllSave()<CR>
imap <F8> <ESC> :call VimwikiAllSave()<CR>
vmap <F8> <ESC> :call VimwikiAllSave()<CR>
func! VimwikiAllSave()
	exec "w"
	exec "VimwikiAll2HTML"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"Vimwiki setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"打开文件时，总是跳到退出之前的光标处
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
