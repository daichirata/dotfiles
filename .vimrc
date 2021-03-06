set nocompatible
filetype off

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.neobundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'surround.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'AutoClose'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'

set t_Co=256
filetype indent plugin on

syntax on
" set background=dark
" colorscheme" solarized

"-------------------------------------------------------------------------------
" Base Setting
"-------------------------------------------------------------------------------
set encoding=utf8                 "エンコーディング設定
set fileencoding=utf-8            "カレントバッファ内のファイルの文字エンコーディングを設定する
set scrolloff=5                   "カーソルの上または下に表示する最小限の行数
set nowrap                        "(no)ウィンドウの幅を超える行の折り返し設定
set nobackup                      "(no)ファイルを上書きする前にバックアップファイルを作る
set backupskip=/tmp/*,/private/tmp/*
set autoread                      "他で書き換えられた場合、自動で読みなおす
set noswapfile                    "swapをつくらない
set hidden                        "編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start    "backspaceで消せるようにする
set vb t_vb=                      "ビープ音を鳴らさない
set clipboard=unnamed,autoselect  "OSのクリップボードを使用する
set list                          "タブ文字、行末など不可視文字を表示する
set nonumber                        "行番号表示
"set number                        "行番号表示
set ruler                         "カーソルが何行目の何列目に置かれているかを表示する
set nocompatible
set nostartofline

"-------------------------------------------------------------------------------
" Mapping
"-------------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------
"inoremap <C-j> <ESC>
"vnoremap <C-j> <ESC>

"Prefix-key
nnoremap [Prefix] <Nop>
nmap <Space> [Prefix]

"Vimrc
nnoremap <silent> [Prefix], :<C-u>edit $MYVIMRC<CR>
nnoremap [Prefix]. :<C-u>source $MYVIMRC<CR>

"Highlight off
nnoremap <silent> [Prefix]<Space> :noh<CR>

"行表示
nnoremap <silent> [Prefix]1 :set number<CR>
nnoremap <silent> [Prefix]2 :set relativenumber<CR>
nnoremap <silent> [Prefix]3 :set nonumber<CR>

"表示行単位で行移動する
nnoremap <silent> j gj
nnoremap <silent> k gk

"emacs like
map! <C-a> <Home>
map! <C-e> <End>
nnoremap <C-a> <Home>
nnoremap <C-e> <End>

"画面切り替え
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"<space>j, <space>kで画面送り
noremap [Prefix]j <C-f><CR><CR>
noremap [Prefix]k <C-b><CR><CR>

"Buffer
"nnoremap <silent> [Prefix]f :edit .<CR>
nnoremap <silent> [Prefix]f :Unite file<CR>
"nnoremap <silent> [Prefix]u :Unite file<CR>
nnoremap <silent> [Prefix]r :Unite file_mru<CR>
nnoremap <silent> [Prefix]s :split<CR>:<C-u>Unite buffer<CR>
nnoremap <silent> [Prefix]S :split<jR><C-w><C-w>:edit .<CR>
nnoremap <silent> [Prefix]v :vsplit<CR>:<C-u>Unite buffer<CR>
nnoremap <silent> [Prefix]V :vsplit<CR><C-w><C-w>:edit .<CR>
nnoremap <silent> [Prefix]b :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> [Prefix]o :<C-u>Unite outline<CR>
nnoremap <silent> [Prefix]d :bd<CR>
nnoremap <silent> [Prefix]n :bn<CR>
nnoremap <silent> [Prefix]p :bp<CR>

"unite.vim
nnoremap <silent> ,uf :<C-u>Unite file<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>

"Insert ahead
"nnoremap <silent> [Prefix]i I

"Insert last
"nnoremap <silent> [Prefix]a A

"Switch status line(q,w)
nnoremap <silent> [Prefix]q :set laststatus=1<CR>
nnoremap <silent> [Prefix]w :set laststatus=2<CR>

"Form feed([Prefix]j, [Prefix]k)
nnoremap [Prefix]j <C-f>
nnoremap [Prefix]k <C-b>

"Screen Separation
nnoremap [Prefix]c <C-w>c<CR><CR>
nnoremap [Prefix]= <C-w>=<CR><CR>
"nnoremap [Prefix]o <C-w>o<CR><CR>

"Tab
nnoremap [Prefix]t :tabnew<CR>
nnoremap [Prefix]L :tabnext<CR>
nnoremap [Prefix]H :tabprevious<CR>
nnoremap [Prefix]O :tabonly<CR>

"any
nnoremap Y y$
onoremap ) t)
onoremap ( t(
vnoremap ) t)
vnoremap ( t(

"-------------------------------------------------------------------------------
" Search
"-------------------------------------------------------------------------------
set ignorecase                     "小文字の検索でも大文字も見つかるようにする
set smartcase                      "ただし大文字も含めた検索の場合はその通りに検索する
set incsearch                      "インクリメンタルサーチを行う
set nowrapscan                     "(no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set history=1000                   "コマンド、検索パターンを100個まで履歴に残す

"-------------------------------------------------------------------------------
" Tab
"-------------------------------------------------------------------------------
set expandtab                      "Insertモードで<Tab> を挿入するのに、適切な数の空白を使う
set tabstop=2                      "ファイル内の <Tab> が対応する空白の数
set smarttab                       "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする

"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

",html.erbと.rbでタブ幅を変更する
au BufNewFile,BufRead *.yml set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.erb set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set nowrap tabstop=2 shiftwidth=2

"-------------------------------------------------------------------------------
" Uitils
"-------------------------------------------------------------------------------
set autoindent                     "新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set hlsearch                       "highlight matches with last search pattern
set shiftwidth=2                   "自動インデントの各段階に使われる空白の数
set listchars=tab:>-               "listで表示される文字のフォーマットを指定する "※デフォルト eol=$ を打ち消す意味で設定
set laststatus=2                   "ステータスラインを表示するウィンドウを設定する "2:常にステータスラインを表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P "ステータス行の表示内容を設定する
set showcmd                        "入力中のステータスに表示する
set undofile
set undodir=~/.vim_undo

"全角表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

"日本語入力リセット
au BufNewFile,BufRead * set iminsert=0

"保存時に末尾の空白を削除
autocmd BufWritePre * :%s/\s\+$//e#

"-------------------------------------------------------------------------------
" Color
"-------------------------------------------------------------------------------
hi clear Pmenu
hi Pmenu ctermbg=white ctermfg=black
hi PmenuSel ctermbg=black ctermfg=white

"-------------------------------------------------------------------------------
" Plugin Setting
"-------------------------------------------------------------------------------
let g:yankring_history_dir='$HOME/.neobundle/YankRing.vim/'

"unite.vim
let g:unite_enable_start_insert = 1

"neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
