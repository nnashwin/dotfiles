" vim:fdm=marker
" Settings -------------------------------------------------------------
" Preamble {{{
" Make vim more useful {{{
set nocompatible
" }}}

" Syntax highlighting {{{
set t_Co=256f
syntax on
colorscheme pablo
" }}}


" Error Message Highlighting {{{

""" Changes popup colors to be more readble 
"""" Customize colors
hi Pmenu ctermbg=darkgray ctermfg=white
hi PmenuSel ctermbg=white ctermfg=black
hi PmenuSbar ctermbg=yellow ctermfg=black
hi CocFloating ctermbg=lightred ctermfg=darkred
" }}}

let mapleader=","

" Local directories {{{
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
set undodir=$HOME/.vim/undo
" }}}

" Set some junk {{{
set autoindent " Copy indent from last line when starting new line
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set foldcolumn=0 " Column to show folds
set foldenable " Enable folding
set foldlevel=0 " Close all folds by default
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes
set mouse=a " Enable mouse in all in all modes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set nu " Enable line numbers
set ofu=syntaxcomplete#Complete " Set omni-completion method
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shell=/bin/sh " Use /bin/sh for executing shell commands
set shiftwidth=4 " The # of spaces for indenting
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set softtabstop=0
set tabstop=8
set expandtab
set shiftwidth=4
set smarttab
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set undofile " Persistent Undo
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
" }}}

" }}}


" Global Functions
function! Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc

" Configuration -------------------------------------------------------------

" General {{{
augroup general_config
  autocmd!

  " Speed up viewport scrolling {{{
  nnoremap <C-e> 3<C-e>
  nnoremap <C-y> 3<C-y>
  " }}}

  " Faster split resizing (+,-) {{{
  if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
  endif
  " }}}

  " Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-H> <C-W>h
  map <C-L> <C-W>l
  " }}}

  " Sudo write (,W) {{{
  noremap <leader>W :w !sudo tee %<CR>
  " }}}

  " Get output of shell commands {{{
  command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
  " }}}

  " Remap :W to :w {{{
  command! W w
  " }}}

  " Better mark jumping (line + col) {{{
  nnoremap ' `
  " }}}

  " Remap keys for auto-completion menu {{{
  inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
  " }}}

  " Paste toggle (,p) {{{
  set pastetoggle=<leader>p
  map <leader>p :set invpaste paste?<CR>
  " }}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Insert newline {{{
  nnoremap <leader><Enter> o<ESC>
  " }}}

  " Search and replace word under cursor (,*) {{{
  nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
  vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
  " }}}

  " Strip trailing whitespace (,ss) {{{
  function! StripWhitespace () " {{{
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction " }}}
  noremap <leader>ss :call StripWhitespace ()<CR>
  " }}}

  " Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
  " }}}

  " Toggle folds (<Space>) {{{
  nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
  " }}}

  " Fix page up and down {{{
  map <PageUp> <C-U>
  map <PageDown> <C-D>
  imap <PageUp> <C-O><C-U>
  imap <PageDown> <C-O><C-D>
  " }}}

" Buffers {{{
augroup buffer_control
  autocmd!

  " Buffer navigation (,,) (gb) (gB) (,ls) {{{
  map <Leader>, <C-^>
  map <Leader>ls :buffers<CR>
  map gb :bnext<CR>
  map gB :bprev<CR>
  " }}}

  " Jump to buffer number (<N>gb) {{{
  let c = 1
  while c <= 99
    execute "nnoremap " . c . "gb :" . c . "b\<CR>"
    let c += 1
  endwhile
  " }}}
augroup END
" }}}

" Jumping to tags {{{
augroup jump_to_tags
  autocmd!

  " Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
  " split instead.
  "
  " Both of them will align the destination line to the upper middle part of the
  " screen.  Both will pulse the cursor line so you can see where the hell you
  " are.  <c-\> will also fold everything in the buffer and then unfold just
  " enough for you to see the destination line.
  nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
  nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>

  " Pulse Line (thanks Steve Losh)
  function! s:Pulse() " {{{
    redir => old_hi
    silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor
    for i in range(end, start, -1 * width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor

    execute 'hi ' . old_hi
  endfunction " }}}

  command! -nargs=0 Pulse call s:Pulse()
augroup END
" }}}

" Word Processor Mode {{{
augroup word_processor_mode
  autocmd!

  function! WordProcessorMode() " {{{
    setlocal formatoptions=t1
    map j gj
    map k gk
    setlocal smartindent
    setlocal spell spelllang=en_ca
    setlocal noexpandtab
    setlocal wrap
    setlocal linebreak
    Goyo 100
  endfunction " }}}
  com! WP call WordProcessorMode()
augroup END
" }}}

" Restore Cursor Position {{{
augroup restore_cursor
  autocmd!

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
" }}}


" Filetypes -------------------------------------------------------------

" C {{{
augroup filetype_c
  autocmd!

  " Highlight Custom C Types {{{
  autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
  autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
  autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
  autocmd BufRead,BufNewFile *.[ch] endif
  " }}}
augroup END
" }}}

" Clojure {{{
augroup filetype_clojure
  autocmd!
  let g:vimclojure#ParenRainbow = 1 " Enable rainbow parens
  let g:vimclojure#DynamicHighlighting = 1 " Dynamic highlighting
  let g:vimclojure#FuzzyIndent = 1 " Names beginning in 'def' or 'with' to be indented as if they were included in the 'lispwords' option
augroup END
" }}}

" Fish {{{
augroup filetype_fish
  autocmd!
  au BufRead,BufNewFile *.fish set ft=fish
augroup END
" }}}

" Go {{{
augroup filetype_go
    autocmd!

    function! AddGoOptions()
        "abbreviations
        iab fpl fmt.Println("")<left><left><c-r>=Eatchar('\s')<cr>
        iab fplv fmt.Println()<left><c-r>=Eatchar('\s')<cr>
        iab fpf fmt.Printf()<left><c-r>=Eatchar('\s')<cr>
        iab fpft fmt.Printf("%v+\n",)<left><c-r>=Eatchar('\s')<cr>
        iab ifnerr if err == nil{}<left><c-r>=Eatchar('\s')<cr>
        iab iferr if err != nil{}<left><c-r>=Eatchar('\s')<cr>
        iab stct type struct {<cr><cr>}<up><up><right><right><right>
        " mappings

        " don't use <CR> in order to add the import or drop you want
        noremap <leader>gd :GoDrop 
        noremap <leader>gf :GoFmt<CR>
        noremap <leader>gi :GoImport 
        noremap <leader>gr :GoRun<CR>
        noremap <leader>gt :GoTest<CR>
    endfunction

    autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
    autocmd BufRead,BufNewFile *.go call AddGoOptions()
    au BufRead,BufNewFile *.go set ft=go
augroup END

" JavaScript {{{
augroup filetype_javascript
    autocmd!
    let g:javascript_conceal = 1

    function! AddJsAbbrevs()
        iab consl console.log();<left><left><c-r>=Eatchar('\s')<cr>
        iab conserr console.error();<left><left><c-r>=Eatchar('\s')<cr>
        iab expdef export default;<left><c-r>=Eatchar('\s')<cr>
    endfunction
    autocmd BufRead,BufNewFile *.js call AddJsAbbrevs()
    "" Use JS abbrevs in typescript file
    autocmd BufRead,BufNewFile *.ts call AddJsAbbrevs()
    autocmd BufRead,BufNewFile *.tsx call AddJsAbbrevs()
augroup END
" }}}

" JSON {{{
augroup filetype_json
    autocmd!
    au BufRead,BufNewFile *.json set ft=json syntax=javascript
augroup END
" }}}

" Markdown {{{
augroup filetype_markdown
    autocmd!
    let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END
" }}}

" COC definitions {{{

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Rust {{{
augroup filetype_rust
    set hidden
    let g:AutoPairs =  {'(':')', '[':']', '{':'}','"':'"', "`":"`", '```':'`````', '"""':'"""""', "'''":"'''''"}"''''"'""""````'}
    function! AddRustOptions()
        " abbreviations
        iab ader #[derive()]<left><left><c-r>=Eatchar('\s')<cr>
        iab adercl #[derive(Clone)]<left><left><c-r>=Eatchar('\s')<cr>
        iab aderd #[derive(Debug)]<left><left><c-r>=Eatchar('\s')<cr>
        iab extc extern crate;<left>
        iab pf pub fn() {<cr><cr>}<up><up><right><right><right><right><right>
        iab pfs pub fn() -> Self {<cr><cr>}<up><up><right><right><right><right><right>
        iab prl println!("{}",);<left><left>
        iab prld println!("{:?}",);<left><left>
        iab stap &'static
        iab stct struct {}<left><left><left>

        let g:rustfmt_autosave = 1

        " mappings
        noremap <leader>rf :RustFmt<cr>
        noremap <leader>rr :RustRun<cr>
    endfunction

    au BufRead,BufNewFile *.rs set ft=rust
    autocmd BufRead,BufNewFile *.rs call AddRustOptions()
augroup END
" }}}


" {{{
" Typescript
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript
" }}}

" }}}
" XML {{{
augroup filetype_xml
  autocmd!
augroup END
" }}}

" ZSH {{{
augroup filetype_zsh
  autocmd!
  au BufRead,BufNewFile .zsh_rc,.functions,.commonrc set ft=zsh
augroup END
" }}}

" Plugin Configuration -------------------------------------------------------------

" Airline.vim {{{
augroup airline_config
  autocmd!
  let g:airline_powerline_fonts = 1
  let g:airline_enable_syntastic = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
augroup END
" }}}

" Silver Searcher {{{
augroup ag_config
  autocmd!

  if executable("ag")
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m

    " Have the silver searcher ignore all the same things as wilgignore
    let b:ag_command = 'ag %s -i --nocolor --nogroup'

    for i in split(&wildignore, ",")
      let i = substitute(i, '\*/\(.*\)/\*', '\1', 'g')
      let b:ag_command = b:ag_command . ' --ignore "' . substitute(i, '\*/\(.*\)/\*', '\1', 'g') . '"'
    endfor

    let b:ag_command = b:ag_command . ' --hidden -g ""'
    let g:ctrlp_user_command = b:ag_command
  endif
augroup END
" }}}

" RainbowParenthesis.vim {{{
augroup rainbow_parenthesis_config
  autocmd!
  nnoremap <leader>rp :RainbowParenthesesToggle<CR>
augroup END
" }}}

" Syntastic.vim {{{
augroup syntastic_config
  autocmd!
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']
  let g:syntastic_cpp_compiler = 'clang++'
  let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
augroup END
" }}}


" Plugins -------------------------------------------------------------

" Load plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'ElmCast/elm-vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'flazz/vim-colorschemes'
Plug 'guns/vim-clojure-static'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/goyo.vim'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'shougo/unite.vim'
Plug 'fatih/vim-go'
Plug 'jceb/vim-orgmode'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'
Plug 'keith/swift.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'msanders/snipmate.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'oplatek/Conque-Shell'
Plug 'pangloss/vim-javascript'
Plug 'Quramy/tsuquyomi'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown',     { 'for': 'markdown' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fireplace'
Plug 'vim-scripts/fish.vim',   { 'for': 'fish' }
Plug 'vim-scripts/jade.vim',   { 'for': 'jade' }
Plug 'wavded/vim-stylus',      { 'for': 'stylus' }
Plug 'wlangstroth/vim-racket'
Plug 'xolox/vim-misc'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'

call plug#end()
" }}}
"
" Custom / Personal Settings / Mappings{{{
" }}}
"
" Ale
let g:ale_fix_on_save = 1
"
" WSL Only
" copy (write) highlighted text to .vimbuffer
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>

" paste from buffer
map <C-v> :r ~/.vimbuffer<CR>

map <C-n> :NERDTreeToggle<CR>
inoremap <special> fd <Esc>
vnoremap <special> fd <Esc>
noremap <leader>b :Unite file buffer<CR>
" remove esc as a valid key
inoremap <esc> <nop>
set relativenumber
" word count
noremap <leader>wc g<c-g>

" move text up and down with - and _
nnoremap - ddkP
nnoremap _ ddp

" indent all code within block easier
nnoremap <c-i> =i{

" open buffer to .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" write file and close split
nnoremap <leader>zz :wq<cr>

" add splits with leader
nnoremap <leader>vs :vsplit<cr>
nnoremap <leader>hs :split<cr>

" delete to end of line in insert
" use a in order to reinsert at the end of the line
inoremap <c-d>e <c-o>D


" Add punctuation to end of line
" Follows the schema <ctrl - a>code
" Stands for Add + mark
" add comma
inoremap <c-a>, <c-o>A,
" add semicolon
inoremap <c-a>; <c-o>A;<esc>

" add big H and big L to jump to the beginning and end of a line
nnoremap H ^
nnoremap L $

" quickly insert line while staying in normal mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" deletes with movement everything in parenthesis
onoremap p i(

" deletes with movement everything in brackets
onoremap b i{

" css abbreviation function
function! AddCssAbbrevs()
    iab b0 border: 0;
    iab crgb color: rgb();<left><left><c-r>=Eatchar('\s')<cr>
    iab h100 height: 100%;
    iab hpx height:px;<left><left><left><c-r>=Eatchar('\s')<cr>
    iab m0 margin: 0;
    iab mpx margin:px;<left><left><left><c-r>=Eatchar('\s')<cr>
    iab ppx padding:px;<left><left><left><c-r>=Eatchar('\s')<cr>
    iab w100 width: 100%;
    iab wpx width:px;<left><left><left><c-r>=Eatchar('\s')<cr>
    iab wpct width:%;<left><left><left><c-r>=Eatchar('\s')<cr>
endfunction

" run this function when you open a css file
autocmd BufRead,BufNewFile *.css call AddCssAbbrevs()


function! AddTsAbbrevs()
    iab consl console.log();<left><left><c-r>=Eatchar('\s')<cr>
endfunction
autocmd BufRead,BufNewFile *.ts call AddTsAbbrevs()

" common abbreviations / spelling mistakes
iab ccopy Copyright 2020 Tyler Boright, All Rights Reserved
iab funciton function
iab direciton direction
iab direciton direction
iab defualt default
iab defalut default
iab grahpics graphics
iab managable manageable
iab manageble manageable
iab pacakage package
iab reuqire require
iab rueqire require

" use broken bar to show tab spacing"
set list lcs=tab:\¦\

filetype plugin indent on

" playground "
function! VisualSelection()
    if mode()=="v"
        let [line_start, column_start] = getpos("v")[1:2]
        let [line_end, column_end] = getpos(".")[1:2]
    else
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
    end
    if (line2byte(line_start)+column_start) > (line2byte(line_end)+column_end)
        let [line_start, column_start, line_end, column_end] =
        \   [line_end, column_end, line_start, column_start]
    end
    let lines = getline(line_start, line_end)
    if len(lines) == 0
            return ''
    endif
    let lines[-1] = lines[-1][: column_end - 1]
    let lines[0] = lines[0][column_start - 1:]
    echom join(lines, "\n")
    return join(lines, "\n")
endfunction

noremap <leader>tf :call VisualSelection()<cr>
