set nocompatible
filetype off " for vundle
set rtp+=$HOME/.vim/vundle/
call vundle#rc()
" git clone git://github.com/gmarik/vundle.git $HOME/.vim/vundle

filetype plugin indent on " restore filetype

" original repos on github
"   - Bundle "git://github.com/<developer>/<plugin_name>/tree/master
"let g:neocomplcache_clang_use_library=1

Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neocomplcache-clang'
Bundle 'Shougo/unite.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'jceb/vim-hier'
Bundle 'vim-scripts/SingleCompile'
Bundle 'vim-scripts/gtags.vim'
"Bundle 'vim-scripts/AutoComplPop'
"Bundle 'vim-scripts/c.vim'

Bundle 'thinca/vim-quickrun.vim'
Bundle 'vim-scripts/a.vim'

Bundle 'quark-zju/vim-cpp-auto-include'


" neocomplcache
"let g:neocomplcache_include_paths.cpp="include/boost"
let g:neocomplcache_enable_at_startup = 1 " 自動起動
function InsertTabWrapper()
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<CR>

"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"autocmd FileType *
"\ if &l:omnifunc == ''
"\ |  setlocal omnifunc=syntaxcomplete#Complete
"\ |  endif



" --------
" Encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

" ------
" Editor
set autoindent
set cindent
set backspace=2

" ------
" Search
set smartcase
set wrapscan

" ------
" Search
if has("syntax")
  syntax on
endif

"function GDB()
"set previewheight=20 " set gdb console initial height
"run macros/gdb_mappings.vim " source key mappings listed in this document
"set asm=0 " don't show any assembly stuff
"set gdbprg=gdb " set GDB invocation string (default 'gdb')
"call gdb("")
"endfunction
"nnoremap <F5> :call GDB()<CR>


set number

set listchars=tab:>-
set list

"set expandtab
set tabstop=2
set shiftwidth=2

set showmatch
set showmode
set showcmd

set hlsearch

set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

nmap <Space> <PageDown>
set pastetoggle=<F8>

"hi LineNr ctermfg=white " 行番号
hi LineNr ctermfg=yellow" 行番号
"hi Comment ctermfg=LightBlue " コメント
hi Comment ctermfg=Blue " コメント
hi Visual term=reverse ctermfg=Red ctermbg=Yellow
"hi Statement ctermfg=white


hi Pmenu ctermbg=5 " ノーマルアイテム
hi PmenuSel ctermbg=6 " 選択しているアイテム
hi PmenuSbar ctermbg=4 " スクロールバー
hi PmenuThumb ctermfg=3 " スクロールバーのレバー

"nmap <F5> :!/usr/bin/python %<CR>
"nmap <F6> :!/usr/lib/python2.7/pdb.py %<CR>

autocmd BufWritePre /Users/kimai/local/src/**.cpp :ruby CppAutoInclude::process

" http://vim-users.jp/2011/03/hack205/
" Comment or uncomment lines from mark a to mark b.
function! CommentMark(docomment, a, b)
  if !exists('b:comment')
    let b:comment = CommentStr() . ' '
  endif
  if a:docomment
    exe "normal! '" . a:a . "_\<C-V>'" . a:b . 'I' . b:comment
  else
    exe "'".a:a.",'".a:b . 's/^\(\s*\)' . escape(b:comment,'/') . '/\1/e'
  endif
endfunction

" Comment lines in marks set by g@ operator.
function! DoCommentOp(type)
  call CommentMark(1, '[', ']')
endfunction

" Uncomment lines in marks set by g@ operator.
function! UnCommentOp(type)
  call CommentMark(0, '[', ']')
endfunction

" Return string used to comment line for current filetype.
function! CommentStr()
  if &ft == 'cpp' || &ft == 'java' || &ft == 'javascript'
    return '//'
  elseif &ft == 'vim'
    return '"'
  elseif &ft == 'python' || &ft == 'perl' || &ft == 'sh' || &ft == 'R' || &ft == 'ruby'
    return '#'
  elseif &ft == 'lisp'
    return ';'
  endif
  return ''
endfunction

nnoremap <Leader>c <Esc>:set opfunc=DoCommentOp<CR>g@
nnoremap <Leader>C <Esc>:set opfunc=UnCommentOp<CR>g@
vnoremap <Leader>c <Esc>:call CommentMark(1,'<','>')<CR>
vnoremap <Leader>C <Esc>:call CommentMark(0,'<','>')<CR>

" http://qiita.com/ryoff/items/ad34584e41425362453e
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

