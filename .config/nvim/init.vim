"     __  ____                      _          _    ___
"    /  |/  (_)___  ____ ___  ____ ( )_____   | |  / (_)___ ___  __________
"   / /|_/ / / __ \/ __ `__ \/ __ \|// ___/   | | / / / __ `__ \/ ___/ ___/
"  / /  / / / / / / / / / / / /_/ / (__  )    | |/ / / / / / / / /  / /__
" /_/  /_/_/_/ /_/_/ /_/ /_/\____/ /____/     |___/_/_/ /_/ /_/_/   \___/

" vim-plug  {{{
call plug#begin('~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround' " change/append sourroundings of sommething - cs'} = change sourrounding single quotes with wavy brackets
Plug 'tpope/vim-repeat' " make surround actions repeatable
Plug 'christoomey/vim-system-copy' " cpit > this copies the content of a tag into your clipboard
Plug 'vim-airline/vim-airline' " shows buffers for files
Plug 'ntpeters/vim-better-whitespace' " better whitespace cleaning
Plug 'nelstrom/vim-visual-star-search' " use * to jump to next instace of current word
Plug 'psliwka/vim-smoothie' " smooth scrolling
Plug 'easymotion/vim-easymotion' " like clicking links in the browser: <leader><leader>W
Plug 'lilydjwg/colorizer' " Colorize colors inline
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cespare/vim-toml'
Plug 'tmhedberg/simpylfold' " fold python easily
Plug 'konfekt/fastfold' " faster folds
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'jremmen/vim-ripgrep' " use ripgrep
Plug 'tpope/vim-obsession' " make sessions smarter
Plug 'stephpy/vim-yaml'
Plug 'chase/vim-ansible-yaml'
Plug 'mattn/emmet-vim'
Plug 'troydm/zoomwintab.vim'
Plug 'jonsmithers/vim-html-template-literals' " lit-html
Plug 'andymass/vim-matchup' " improve % and add text objects i% and a%
Plug 'chaoren/vim-wordmotion' " camelcasemotion
Plug 'crusoexia/vim-monokai'
Plug 'kana/vim-textobj-user' " Add new textobjects easily
Plug 'kana/vim-textobj-entire' " textobj: ae entire buffer, ie buffer without leading and trailing empty lines
Plug 'wellle/targets.vim' " more text objects
Plug 'jeetsukumaran/vim-pythonsense' " Add python text objects: ac, ic, af, if
Plug 'paroxayte/vwm.vim' "Manage Window layouts
Plug 'liuchengxu/vista.vim' " Symbol outline
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Stuff to check out {{{
" ReplaceWithRegister - make replacing repeatable
" Titlecase - change casing of a line/ a word
" Sortmotion sort stuff alphabetically
" twig highlight - syntax highlighting
" Color preview
" sideways.vim
" Plug 'idanarye/vim-merginal': use fugitive for branches
" }}}
call plug#end()
" }}}
" Misc {{{
filetype plugin indent on
set mouse=a
set shell=bash
set title " vim controls the title of the terminal
let $PAGER=''
set splitbelow
set splitright
set tabstop=4       " number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4   " number of spaces in tab when editing
" don't fuck with pasting
set pastetoggle=<F2>
let g:wordmotion_prefix = '<Leader>'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:html_indent_style1 = "inc"
" }}}
" Colortheme {{{
syntax on
colorscheme monokai
set termguicolors
" }}}
" coc.nvim {{{
let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-highlight',
            \'coc-prettier',
            \'coc-pairs',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-eslint',
            \'coc-tsserver',
				    \'coc-angular',
            \'coc-yaml',
            \'coc-ccls'
            \]
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  "" autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
 set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" }}}
" LeaderF{{{
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 1
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_ShowHidden = 0
let g:Lf_RecursSubmodules = 1

let g:LfDiscardEmptyBuffer = 1

let g:Lf_RgConfig = [
		\ "-uu",
	\ ]

" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
" }}}
" VWM{{{
" Default config for bot terminal
let s:def_layt = {
      \  'name': 'default',
      \  'set_all': ['nonu', 'nornu'],
      \  'bot':
      \  {
      \    'h_sz': 12,
      \    'init': ['term fish']
      \  }
      \}

if !exists('g:vwm#layouts')
  let g:vwm#layouts = [s:def_layt]
endif
" terminal bottom with split
let s:def_split_layt = {
      \  'name': 'defaultsplit',
      \  'set_all': ['nonu', 'nornu'],
	  \  'right':
	  \  {
	  \  'init': []
	  \	 },
      \  'bot':
      \  {
      \    'h_sz': 12,
      \    'init': ['term fish']
      \  }
      \}

let g:vwm#layouts += [ s:def_split_layt]
" }}}
" Undo Settings {{{
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
" }}}
" Search {{{
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set hlsearch            " highlight matches
set path +=**
set wildmenu
" }}}
" UI {{{
set number relativenumber " show hybrid line numbers
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}
" Formatting {{{
" Rust {{{
let g:rustfmt_autosave = 1 " format rust on saving a buffer
" }}}
" JSON {{{

" }}}
" }}}
" Syntax Checking {{{
" json syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" comma open/closes folds
nnoremap , za
set foldmethod=expr   " fold based on specified expression
set foldmethod=marker
set foldlevel=0
set modelines=1
" }}}
" Autocompletion {{{
" }}}
" Mappings {{{
" split navigations {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" }}}
" Map the leader key to SPACE
let mapleader="\<SPACE>"
" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>
" Use Q to execute default register.
nnoremap Q @q
" Nerdtree
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>r :NERDTreeFind<cr>

nnoremap <leader>b :LeaderfBuffer<cr>

" List buffers and select by number
nnoremap gb :ls<CR>:b<Space>

" ZoomWinTab
nnoremap <C-w>o :ZoomWinTabToggle<CR>

" Use Ctrl D to delete the next char
imap <C-d> <Del>


" Disable Scrolling{{{
:nmap <ScrollWheelUp> <nop>
:nmap <S-ScrollWheelUp> <nop>
:nmap <C-ScrollWheelUp> <nop>
:nmap <ScrollWheelDown> <nop>
:nmap <S-ScrollWheelDown> <nop>
:nmap <C-ScrollWheelDown> <nop>
:nmap <ScrollWheelLeft> <nop>
:nmap <S-ScrollWheelLeft> <nop>
:nmap <C-ScrollWheelLeft> <nop>
:nmap <ScrollWheelRight> <nop>
:nmap <S-ScrollWheelRight> <nop>
:nmap <C-ScrollWheelRight> <nop>

:imap <ScrollWheelUp> <nop>
:imap <S-ScrollWheelUp> <nop>
:imap <C-ScrollWheelUp> <nop>
:imap <ScrollWheelDown> <nop>
:imap <S-ScrollWheelDown> <nop>
:imap <C-ScrollWheelDown> <nop>
:imap <ScrollWheelLeft> <nop>
:imap <S-ScrollWheelLeft> <nop>
:imap <C-ScrollWheelLeft> <nop>
:imap <ScrollWheelRight> <nop>
:imap <S-ScrollWheelRight> <nop>
:imap <C-ScrollWheelRight> <nop>
" }}}
" }}}
" Git {{{
" GitGutter{{{
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
" Update sign column every quarter second
set updatetime=250
" }}}
highlight GitGutterAdd    guifg=#009900 guibg=<X> ctermfg=2
highlight GitGutterChange guifg=#bbbb00 guibg=<X> ctermfg=3
highlight GitGutterDelete guifg=#ff2222 guibg=<X> ctermfg=1
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)  " git next
nmap <Leader>gp <Plug>(GitGutterPrevHunk)  " git previous
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)  " git add (chunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)   " git undo (chunk)

" Open vimagit pane
nnoremap <leader>gs :Magit<CR>       " git status
" Push to remote
nnoremap <leader>gP :! git push<CR>  " git Push
" Enable deletion of untracked files in Magit
let g:magit_discard_untracked_do_delete=1
" }}}
" commands {{{
command! Install :w | :source % | :PlugInstall
" }}}
" Snippets {{{
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" }}}
" Scrolling {{{
if !&scrolloff
        set scrolloff=5       " Show next 5 lines while scrolling.
    endif
    if !&sidescrolloff
        set sidescrolloff=5   " Show next 5 columns while side-scrolling.
    endif
" }}}
" Snippets {{{
" }}}
" Language specific {{{
" YAML{{{
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" }}}
" }}}
" Most stuff from here: https://dougblack.io/words/a-good-vimrc.html
" vim:foldmethod=marker:foldlevel=0
