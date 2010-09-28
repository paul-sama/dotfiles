set nocompatible
filetype plugin on
syntax on

set nu
set nobackup

set ruler
set showmode
set bg=dark

set wildmenu           "Turn on Wild menu
set encoding=utf-8
set fileencodings=utf-8,gbk,gb2312,gb18030,cp936
"set guifont=Monospace\ 16


if  (has("gui_running"))
    colo corey
else
    colo desert
endif

set shiftwidth=4
set softtabstop=4
set tabstop=4

:inoremap ( ()<ESC>i
:inoremap { {}<ESC>i
:inoremap [ []<ESC>i
:inoremap < <><ESC>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call CRJava()<CR>
imap <F5> <ESC> :call CRJava ()<CR>
vmap <F5> <ESC> :call CRJava()<CR>
func! CRJava()
	exec "w"
	exec "!javac %"
	exec "!java %<"
endfunc

map <F6> :call CRPython()<CR>
imap <F6> <ESC> :call CRPython()<CR>
vmap <F6> <ESC> :call CRPython()<CR>
func! CRPython()
	exec "w"
	exec "!python %"
endfunc

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
