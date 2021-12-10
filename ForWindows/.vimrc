" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Mouse behavior (the Unix way)
behave xterm

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
:set clipboard^=unnamed,unnamedplus
:set guifont=Consolas:h24
:set guioptions-=T
:set mouse=a
:set nocompatible
:set modifiable
:set backspace=indent,eol,start
:set nu
:set cindent
:set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1
" :set encoding=utf-8
" :set termencoding=utf-8
:set linespace=-1
:set linebreak
:set showmatch
:set autoread
:set cursorline
:set expandtab
:set shiftwidth=2
:set softtabstop=-1
:set smartindent
:set tabstop=2
:set t_Co=256
:set background=light
:let base16colorspace=256
:set termguicolors
:syntax on
:filetype indent on
:colorscheme xcode
:set noundofile
:set nobackup
:set viminfo='1000,<1000
:set nopaste
:set autochdir
map <c-b> :call CompileRunGcc()<CR>
imap <c-b> <Esc> :call CompileRunGcc()<CR>
map <c-l> :close<CR>
imap <c-l> <Esc> :close<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'cpp'
		exec ":silent !del %<.exe"
		exec ":!g++ -Wall % -o %<"
    exec ":ter %<"
	endif
endfunc
" Removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre *.cpp :call TrimWhiteSpace()
