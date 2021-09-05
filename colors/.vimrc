:set mouse=a
:set nocompatible
:set modifiable
:set backspace=indent,eol,start
:set nu
:set cursorline
:set cindent
:set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1
:set encoding=utf-8
:set termencoding=utf-8
:set linespace=-1
:set textwidth=80
:set linebreak
:set showmatch
:set autoread
:set expandtab
:set shiftwidth=2
:set softtabstop=-1
:set smartindent
:set tabstop=2
:set t_Co=256
:set background=light
:let base16colorspace=256
:set termguicolors
:colorscheme xcode
:syntax on
:filetype indent on
:set noundofile
:set nobackup
:set viminfo='1000,<1000
:set nopaste
:set autochdir
map <c-k> :call CompileRunGcc()<CR>
imap <c-k> <Esc> :call CompileRunGcc()<CR>
map <c-l> :close<CR>
imap <c-l> <Esc> :close<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'cpp'
		exec ":!g++ % -o %<"
    exec ":ter ./%<"
	endif
endfunc
" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
  exec ":!gg=G"
  exec ":!rm %<"
endfunction
autocmd BufWritePre *.cpp :call TrimWhiteSpace()
