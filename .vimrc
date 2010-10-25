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

"Show autocomplete menus
set wildmenu

"Show editing mode
set showmode

"Sets how many lines of history VIM to remember
set history=400

"Set to auto read when a file is changed from the outside
set autoread

"Turn backup off
set nobackup

set bg=dark

set encoding=utf-8
set fileencodings=utf-8,gbk,gb2312,gb18030,cp936

colo desert

set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set expandtab

"Bash like
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>

:inoremap (		()<ESC>i
:inoremap {		{}<ESC>i
:inoremap [		[]<ESC>i
:inoremap <		<><ESC>i

ino    <M-k>    <Up>
ino    <M-j>    <Down>
ino    <M-h>    <Left>
ino    <M-l>    <Right>
ino    <M-u>    <C-Left>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map  <F7>   :call VimwikiSave()<CR>
imap <F7>   <ESC> :call VimwikiSave()<CR>
vmap <F7>   <ESC> :call VimwikiSave()<CR>
func! VimwikiSave()
	exec "w"
	exec "Vimwiki2HTML"
endfunc

map  <F8>   :call VimwikiAllSave()<CR>
imap <F8>   <ESC> :call VimwikiAllSave()<CR>
vmap <F8>   <ESC> :call VimwikiAllSave()<CR>
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
