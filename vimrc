
set nocompatible                "Turn off compability mode with Vi, we don't need that anymore
filetype off " required

" Vundle setting {{{
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'rizzatti/funcoo.vim' 
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'jheroy/ctrlp'
Bundle 'gregsexton/VimCalc'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mileszs/ack.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'gregsexton/gitv'
Bundle 'vim-scripts/matchit.zip'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'myusuf3/numbers.vim'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'SirVer/ultisnips'
Bundle 'Shougo/unite.vim'
Bundle 'bling/vim-airline'
Bundle 'jheroy/vim-solarized'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-surround'
Bundle 'jheroy/vim-gocode'
Bundle 'nsf/gocode'
Bundle 'tomasr/molokai'
" }}}
" Pathogen setting {{{
"execute pathogen#infect('base/{}') 
"if isdirectory(expand("$HOME/.vim/custom/"))
"        execute pathogen#infect('custom/{}')
"        source $HOME/.vim/custom/vimrc
"endif
"execute pathogen#helptags()
""}}}
" Check for ctags folder, if not exist extract our ctags binary {{{
if !isdirectory(expand("$HOME/.vim/binary/ctags/"))
        let ctags_bottle_dir =  expand("$HOME/.vim/binary/")
        let ctags_bottle_file = expand("$HOME/.vim/binary/ctags-5.8.mountain_lion.bottle.tar.gz")
        execute "cd ".ctags_bottle_dir
        execute "!tar xfv ".ctags_bottle_file
endif
"}}}
" Basic setting {{{
syntax on
filetype plugin indent on
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2

set expandtab
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set clipboard=unnamed
let mapleader = ','
set linespace=5
set completeopt=""
set updatetime=100
" set fmr={,}
set foldmethod=syntax
" set foldmethod=marker
set foldclose=all
" set foldopen=all
set switchbuf=usetab,newtab     " open new buffers always in new tabs
autocmd FileType go :set noexpandtab
"}}}
" Colorscheme {{{
let macvim_skip_colorscheme=1
let g:molokai_original=1
set background=dark
colorscheme molokai
" colorscheme mine
" colorscheme zmrok
" }}}
" GUI setting{{{
if has("gui_running") 
        if has("gui_macvim")
                " Display {{{
                set background=light
                colorscheme solarized
                set cursorline
                set cursorcolumn
                hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=#DEf8C5
                hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=#DEf8C5
                hi VertSplit   cterm=NONE ctermbg=darkred ctermfg=white guibg=#FDF6E3
                set fillchars=vert:\ 
                set guifontwide=翩翩体-简:h13
                set clipboard+=unnamed
                set vb t_vb=
                " set guifont=Consolas:h14
                set guifont=GohuFont:h14
                set transparency=5 " Make the window slightly transparent
                set numberwidth=4
                set guioptions=''
                "}}}
                " Open file fuzzy {{{
                let g:ctrlp_map = '<D-p>'
                nmap <D-t> :Unite file_rec<cr>
                " Open goto file
                " nmap <D-t> :CtrlP<cr>
                " imap <D-t> <esc>:CtrlP<cr>
                " }}}
                " Open goto symbol on current buffer {{{
                nmap <D-r> :MyCtrlPTag<cr>
                imap <D-r> <esc>:MyCtrlPTag<cr>
                nmap <c-]> g<c-]>
                nmap <D-]> g<c-]>
                nmap <C-x> :!
                " Open goto symbol on all buffers
                nmap <D-R> :CtrlPBufTagAll<cr>
                imap <D-R> <esc>:CtrlPBufTagAll<cr>
                "}}}
                " Run current .go {{{
                nmap <F5> :!go run %<cr>
                imap <F5> <esc>:!go run %<cr>
                "}}}
                " buffer {{{
                nmap <D-w> :bd<cr>
                imap <D-w> <esc>:bd<cr>
                nmap <S-H> :bp<CR>
                nmap <S-L> :bn<CR>
                "}}}
                " Comment lines with cmd+/ {{{
                map <D-/> :TComment<cr>
                vmap <D-/> :TComment<cr>gv
                "}}}
                " Search map {{{ 
                nmap <D-f> :Ack <C-R>=expand("<cword>")<CR>
                imap <D-f> <ESC>:Ack <C-R>=expand("<cword>")<CR>
                vnoremap <D-f> y :Ack "<C-R>=escape(@", '\\/.*$^~[]()"')<CR>"
                nmap <D-m> :Ack '^\s*// *FIXME\|^\s*//\s*BUG\|^.*//\s*TODO'<CR>
                nmap <D-d> :Dash<CR>
                vnoremap <D-d> y :Dash <C-R>=escape(@", '\\/*$^~[]')<CR><CR>
                "}}}
                " This mapping makes Ctrl-Tab switch between tabs. {{{ 
                " Ctrl-Shift-Tab goes the other way.
                noremap <C-Tab> :tabnext<CR>
                noremap <C-S-Tab> :tabprev<CR>
                "}}}
                " switch between tabs with cmd+1, cmd+2,... {{{
                map <D-1> 1gt
                map <D-2> 2gt
                map <D-3> 3gt
                map <D-4> 4gt
                map <D-5> 5gt
                map <D-6> 6gt
                map <D-7> 7gt
                map <D-8> 8gt
                map <D-9> 9gt
                " until we have default MacVim shortcuts this is the only way to use it in
                " insert mode
                imap <D-1> <esc>1gt
                imap <D-2> <esc>2gt
                imap <D-3> <esc>3gt
                imap <D-4> <esc>4gt
                imap <D-5> <esc>5gt
                imap <D-6> <esc>6gt
                imap <D-7> <esc>7gt
                imap <D-8> <esc>8gt
                imap <D-9> <esc>9gt
                "}}}
                " NerdTree {{{
                " map <D-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
                map <D-e> <plug>NERDTreeTabsToggle<CR>
                map <leader>e :NERDTreeFind<CR><CR>
                "Open sidebar with cmd+k
                map <D-k> :NERDTreeTabsToggle<CR>
                "}}}
                " Tabularize map {{{
                nmap <Leader>a& :Tabularize /&<CR>
                vmap <Leader>a& :Tabularize /&<CR>
                nmap <Leader>a= :Tabularize /=<CR>
                vmap <Leader>a= :Tabularize /=<CR>
                nmap <Leader>a: :Tabularize /:<CR>
                vmap <Leader>a: :Tabularize /:<CR>
                nmap <Leader>a:= :Tabularize /:=<CR>
                vmap <Leader>a:= :Tabularize /:=<CR>
                nmap <Leader>a:: :Tabularize /:\zs<CR>
                vmap <Leader>a:: :Tabularize /:\zs<CR>
                nmap <Leader>a, :Tabularize /,<CR>
                vmap <Leader>a, :Tabularize /,<CR>
                nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
                vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
                "}}}
                " Window switch map {{{
                map <D-j> <C-W>j
                map <D-k> <C-W>k
                map <D-l> <C-W>l
                map <D-h> <C-W>h
                "}}}
                " Easymotion {{{
                nmap <D-;> ,,f
                nmap <D-:> ,,F
                "}}}
                " cscope {{{"
                nmap <D-\> :cs find c <C-R>=expand("<cword>")<CR><CR>
                nmap <D-[> :cs find s <C-R>=expand("<cword>")<CR><CR>
                " nmap <D-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
                " }}}
                " simple surround {{{
                vmap " S"
                vmap ' S'
                vmap ` S'
                vmap [ S[
                vmap ( S(
                vmap { S{
                vmap } S}
                vmap ] S]
                vmap ) S)
                "}}}
                " Select text whit shift
                let macvim_hig_shift_movement = 1
                " Stop completion with enter, in addition to default ctrl+y
                imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
        endif
endif
"}}}
" Fold setting{{{
" fold map {{{
map <leader>f0 :set fdl=0<cr>
map <leader>f1 :set fdl=1<cr>
map <leader>f2 :set fdl=2<cr>
map <leader>f3 :set fdl=3<cr>
map <leader>f4 :set fdl=4<cr>
map <leader>fc :set fdc=1<cr>
map <leader>fo :set fdc=0<cr>
nmap <space> za
" vmap <space> :foldo<cr>
vmap <space> zO
"}}}
fu! CustomFoldText() 
        "get first non-blank line
        let fs = v:foldstart
        while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
        endwhile
        if fs > v:foldend
                let line = getline(v:foldstart)
        else
                let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
        endif

        let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
        let foldSize = 1 + v:foldend - v:foldstart
        let foldSizeStr = " " . foldSize . " lines "
        let foldLevelStr = repeat("+--", v:foldlevel)
        let lineCount = line("$")
        let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
        let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
        return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf
set foldtext=CustomFoldText()
"}}}
" Ctrlp {{{
let g:ctrlp_cmd = 'CtrlPMixed'			" search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'	" search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 1		" show the match window at the top of the screen
let g:ctrlp_max_height = 10				" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'		" jump to a file if it's open already
let g:ctrlp_use_caching = 1				" enable caching
let g:ctrlp_clear_cache_on_exit=0  		" speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250 				" number of recently opened files
let g:ctrlp_custom_ignore = {
                        \ 'dir':  '\v[\/]\.(git|hg|svn|build)$',
                        \ 'file': '\v\.(exe|so|dll)$',
                        \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
                        \ }

func! MyPrtMappings()
        let g:ctrlp_prompt_mappings = {
                                \ 'AcceptSelection("e")': ['<c-t>'],
                                \ }
endfunc

func! MyCtrlPTag()
        let g:ctrlp_prompt_mappings = {
                                \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
                                \ 'AcceptSelection("t")': ['<c-t>'],
                                \ }
        CtrlPBufTag
endfunc

let g:ctrlp_buffer_func = { 'exit': 'MyPrtMappings' }
com! MyCtrlPTag call MyCtrlPTag()

" TODO: add javascript and some other languages who doesn't have ctags support
" coffee: https://gist.github.com/michaelglass/5210282
" go: http://stackoverflow.com/a/8236826/462233 
" objc:  http://www.gregsexton.org/2011/04/objective-c-exuberant-ctags-regex/
" rust: https://github.com/mozilla/rust/blob/master/src/etc/ctags.rust
let g:ctrlp_buftag_types = {
                        \ 'go'     	   : '--language-force=go --golang-types=ftv',
                        \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
                        \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
                        \ 'objc'       : '--language-force=objc --objc-types=mpci',
                        \ 'rc'         : '--language-force=rust --rust-types=fTm'
                        \ }

let g:ctrlp_open_new_file = 'r'
let g:ctrlp_prompt_mappings = {
                        \ 'PrtBS()':              ['<bs>', '<c-]>'],
                        \ 'PrtDelete()':          ['<del>'],
                        \ 'PrtDeleteWord()':      ['<c-w>'],
                        \ 'PrtClear()':           ['<c-u>'],
                        \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
                        \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
                        \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
                        \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
                        \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
                        \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
                        \ 'PrtHistory(-1)':       ['<c-n>'],
                        \ 'PrtHistory(1)':        ['<c-p>'],
                        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
                        \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
                        \ 'AcceptSelection("t")': ['<c-t>'],
                        \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
                        \ 'ToggleFocus()':        ['<s-tab>'],
                        \ 'ToggleRegex()':        ['<c-r>'],
                        \ 'ToggleByFname()':      ['<c-d>'],
                        \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
                        \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
                        \ 'PrtExpandDir()':       ['<tab>'],
                        \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
                        \ 'PrtInsert()':          ['<c-\>'],
                        \ 'PrtCurStart()':        ['<c-a>'],
                        \ 'PrtCurEnd()':          ['<c-e>'],
                        \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
                        \ 'PrtCurRight()':        ['<c-l>', '<right>'],
                        \ 'PrtClearCache()':      ['<F5>'],
                        \ 'PrtDeleteEnt()':       ['<F7>'],
                        \ 'CreateNewFile()':      ['<c-y>'],
                        \ 'MarkToOpen()':         ['<c-z>'],
                        \ 'OpenMulti()':          ['<D-o>'],
                        \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
                        \ }
"}}}
" YouCompleteMe {{{
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion=1
" let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_complete_in_comments=0
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_key_list_previous_completion = ['<C-K>']
let g:ycm_key_list_select_completion = ['<C-J>']
let g:ycm_semantic_triggers =  {
                        \   'c' : ['->', '.'],
                        \   'objc' : ['->', '.'],
                        \   'cpp,objcpp' : ['->', '.', '::'],
                        \   'perl' : ['->'],
                        \   'php' : ['->', '::'],
                        \   'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
                        \   'lua' : ['.', ':'],
                        \   'erlang' : [':'],
                        \ }
"}}}
" Session {{{
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1
"}}}
" DelimitMate {{{
"create line break when pressing enter
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
"}}}
" Multi cursor {{{
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<D-d>'
let g:multi_cursor_prev_key = '<D-u>'
let g:multi_cursor_skip_key = '<D-k>' "until we got multiple keys support
let g:multi_cursor_quit_key = '<Esc>'
"}}}
" UltiSnips {{{
function! g:UltiSnips_Complete()
        call UltiSnips_ExpandSnippet()
        if g:ulti_expand_res == 0
                if pumvisible()
                        return "\<C-n>"
                else
                        call UltiSnips_JumpForwards()
                        if g:ulti_jump_forwards_res == 0
                                return "\<TAB>"
                        endif
                endif
        endif
        return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips-snippets"]
" let g:UltiSnipsExpandTrigger="<s-tab>"
" }}}
" Reopen last closed buffers "{{{
" exclude the buffer closed with :bw :qall :)
aug BufList
        au!
        au vimenter * let g:bufList=[]
        au bufwinleave * call AddBufList()
aug END
nmap <silent> <c-w>z :call OpenBufList()<cr>
nmap <silent> <c-w><c-z> <c-w>z
function! AddBufList()
        let b=expand('<abuf>')
        if b > 0
                let g:bufList=add(g:bufList,b)
        endif
endfunction
function! OpenBufList()
        if len(g:bufList) !=0
                exec "sb ".remove(g:bufList,-1)
        endif
endfunction "}}}
" Syntastic {{{
let g:syntastic_check_on_wq=0
" let g:syntastic_auto_jump=1
" let g:syntastic_auto_loc_list=1
" }}}
" Alias {{{


command! Ks lcd ~/work/git/kings-server/ 
command! Gt lcd ~/work/git/global-theat-server/
command! Gg lcd ~/work/git/global-theat-gateway/
command! Gm lcd ~/work/git/global-theat-moderator/
command! Ka lcd ~/work/git/kings-admin-api/ 
command! Kga lcd ~/work/git/kings-gateway-admin/
command! Kg lcd ~/work/git/kings-gateway/
command! Akm lcd ~/work/git/kings-moderator/
command! Ke2 lcd ~/work/git/ke2/
command! Aks lcd ~/work/git/android-kings-server/ 
command! Aka lcd ~/work/git/android-kings-admin-api/ 
command! Akga lcd ~/work/git/android-kings-gateway-admin/
command! Akg lcd ~/work/git/android-kings-gateway/

"command! Agm lcd ~/work/git/kings-moderator/
command! Ags lcd ~/work/git/android-galaxy-server/ 
command! Aga lcd ~/work/git/android-galaxy-admin-api/ 
command! Agga lcd ~/work/git/android-galaxy-gateway-admin/
command! Agg lcd ~/work/git/android-galaxy-gateway/
"}}}
" FileType setting {{{
" autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :%s/\s\+$//e
" autocmd FileType go autocmd BufWritePre <buffer> Fmt
" autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
" autocmd FileType go,c,cpp set ts=8
autocmd FileType vim set fdm=marker
autocmd FileType go set fdm=syntax
" }}}
" 让vim记住上次编辑的位置 {{{
autocmd BufReadPost *
                        \ if line("'\"")>0&&line("'\"")<=line("$") |
                        \   exe "normal g'\"" |
                        \ endif ""'")
"}}}
" Cscope {{{
if has("cscope")
        " set csprg=/usr/local/bin/cscope
        set csto=0
        set cst
        set nocsverb
        " add any database in current directory
        if filereadable("cscope.out")
                cs add cscope.out
                " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
                cs add $CSCOPE_DB
        endif
        set csverb
end
"}}}
" Tagbar {{{
let g:tagbar_ctags_bin="/Users/wenhuxian/homebrew/bin/ctags"
" let g:tagbar_type_go = {
"     \ 'ctagstype': 'go',
"     \ 'kinds' : [
"         \'p:package',
"         \'f:function',
"         \'v:variables',
"         \'t:type',
"         \'c:const'
"     \]
" \}
map <D-y> :TagbarToggle<cr>
let g:tagbar_autofocus=1
let g:tagbar_sort=0
let g:tagbar_type_go = {
                        \ 'ctagstype' : 'go',
                        \ 'kinds'     : [
                        \ 'p:package',
                        \ 'i:imports:1',
                        \ 'c:constants',
                        \ 'v:variables',
                        \ 't:types',
                        \ 'n:interfaces',
                        \ 'w:fields',
                        \ 'e:embedded',
                        \ 'm:methods',
                        \ 'r:constructor',
                        \ 'f:functions'
                        \ ],
                        \ 'sro' : '.',
                        \ 'kind2scope' : {
                        \ 't' : 'ctype',
                        \ 'n' : 'ntype'
                        \ },
                        \ 'scope2kind' : {
                        \ 'ctype' : 't',
                        \ 'ntype' : 'n'
                        \ },
                        \ 'ctagsbin'  : 'gotags',
                        \ 'ctagsargs' : '-sort -silent'
                        \ }
"}}}
" Buffer switch {{{
augroup CursorLineOnlyInActiveWindow
        autocmd!
        autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        autocmd VimEnter,WinEnter,BufWinEnter handle*.go setlocal fmr={,}
        autocmd VimEnter,WinEnter,BufWinEnter handle*.go setlocal fdm=marker
        autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
        autocmd VimEnter,WinEnter,BufWinEnter * hi CursorLineNr   cterm=NONE ctermbg=darkred ctermfg=white guibg=#def8c5
        autocmd WinLeave * setlocal nocursorline
        autocmd WinLeave * setlocal nocursorcolumn
        " autocmd WinLeave * hi CursorLineNr   cterm=NONE ctermbg=darkred ctermfg=white guibg=#373832
augroup END
"}}}
" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='serene' 
"}}}
let g:ackhighlight=1
let g:TagmaBufMgrLastLine = 1
autocmd BufWinEnter,BufNewFile * silent tabo
let g:nerdtree_tabs_open_on_gui_startup = 0
