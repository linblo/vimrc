call plug#begin('~/.nvim/plugged')
" Are we modern or Bram zealots?
if has('nvim')
else
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Startify
Plug 'mhinz/vim-startify'

" Conquerer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" The lightline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" The fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Colorschemes and Themes
Plug 'MaxSt/FlatColor'
Plug 'NLKNguyen/papercolor-theme'
Plug 'flrnprz/plastic.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'

" surround
Plug 'tpope/vim-surround'
" Quoting
Plug 'jiangmiao/auto-pairs'

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'git-time-metric/gtm-vim-plugin'

" Tabular
Plug 'godlygeek/tabular'

" Markdown support
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" Ale
Plug 'w0rp/ale'

" PHP
" Plug 'shawncplus/phpcomplete.vim'
"Plug 'stephpy/vim-php-cs-fixer'
" Plug 'StanAngeloff/php.vim'

" YAML
" Plug 'stephpy/vim-yaml'

" Javascript
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
" Plug 'ruanyl/vim-fixmyjs'
" Plug 'pangloss/vim-javascript'

" Typescript
Plug 'HerringtonDarkholme/yats.vim'

" Core
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'

Plug 'airblade/vim-rooter'
Plug 'lambdalisue/gina.vim'

" Nerdtree
Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'lambdalisue/vim-gita'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" devicons
Plug 'ryanoasis/vim-devicons'

" base64
Plug 'christianrondeau/vim-base64'

" Quake style console
" if has('nvim')
"   Plug 'https://gitlab.com/Lenovsky/nuake.git'
" end

" Code
" Plug 'metakirby5/codi.vim'
" Themes

" Disabled
" Plug 'edkolev/promptline.vim'
" Plug 'albertorestifo/github.vim'
" Plug 'mileszs/ack.vim'
" Plug 'tpope/vim-vinegar'
" Plug 'scrooloose/nerdcommenter'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'ntpeters/vim-better-whitespace'
" Plug 'bfredl/nvim-miniyank'

call plug#end()

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set encoding=utf-8
set fileencoding=utf-8
" autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
set autochdir
set number
set relativenumber
set clipboard=unnamedplus
set expandtab
set autoindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" Splits
set splitright
set splitbelow

syntax enable

set textwidth=80
set colorcolumn=+1

if executable('rg')
  set grepprg=rg\ --vimgrep
endif

if has("termguicolors")
 set termguicolors
endif

" if !has('gui_running') && !has('nvim')
"   set t_Co=256
" endif

" Theme
" set background=dark
" let g:two_firewatch_italics=1

" Theme nord
let g:nord_italic=1
let g:nord_bold=1
let g:nord_underline=1
colorscheme nord

" Emmet
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" FOLDING
"set foldmethod=syntax
"set foldlevelstart=1

"let javaScript_fold=1         " JavaScript
"let perl_fold=1               " Perl
"let php_folding=1             " PHP
"let r_syntax_folding=1        " …
"
" File formats
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType php set tabstop=4|set shiftwidth=4|set expandtab|set softtabstop=4
autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2
autocmd FileType typescript set tabstop=2|set shiftwidth=2|set expandtab|set softtabstop=2

au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" ripgrep setup
if executable('rg')
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
endif

" Lost in space
let mapleader = "\<Space>"

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Ale config
let g:ale_sign_error = '☛'
let g:ale_sign_warning = '☛'

let g:ale_linters = {
  \   'python': ['flake8', 'pylint'],
  \   'javascript': ['eslint'],
  \   'vue': ['eslint']
\}
let g:ale_fixers = {
  \    'javascript': ['prettier', 'eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
\}

let g:ale_fix_on_save = 0
let g:lightline#ale#indicator_warnings = ''
let g:lightline#ale#indicator_errors = ''
let g:lightline#ale#indicator_ok = ''

" Rooter setup
let g:rooter_patterns = ['.git', '.git/', '.projectile', '.drone.yml', 'package.json']
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_use_lcd = 1
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1

" webdevicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 0
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" Markdown
let g:vim_markdown_folding_disabled = 1

" Highlights
highlight clear aleerrorsign
highlight clear alewarningsign
highlight ALEErrorSign ctermfg=Red guifg=Red
highlight ALEWarningSign ctermfg=Yellow guifg=Yellow
highlight MatchParen ctermfg=Black ctermbg=Cyan guifg=Black guibg=Cyan

" Keybinds
nnoremap <C-t> :NERDTreeToggle<CR>
map <Leader>bn :bn<cr>
map <Leader>bp :bp<cr>
map <Leader>bd :bd<cr>
map <Leader>w  :w!<cr>
map <Leader>q  :q!<cr>
nnoremap <C-p> :FZF<CR>

" Easymotion
map <Leader><Leader>/ <Plug>(easymotion-sn)
omap <Leader><Leader>/ <Plug>(easymotion-tn)
map  <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
map <Leader><Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>L <Plug>(easymotion-overwin-line)
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
nmap <Leader>W :Windows<cr>
nmap <Leader>B :Buffers<cr>
nmap <Leader>G :GFiles<cr>
nmap <Leader>F :Rg 
nmap <Leader>H :History<cr>
nmap <Leader>h :History<cr>
nmap <Leader>C :History:<cr>

map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)

nnoremap <Leader>u :UndotreeToggle<cr>
noremap <Leader><Leader>= :ALEFix<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

inoremap jk <Esc>
inoremap jj <Esc>
inoremap §§ <Esc>

" noremap <C-C> <Esc>

nnoremap silent vv <C-W><C-v>

if filereadable(stdpath("config") . '/startify.vim')
  execute "source " . stdpath("config") . '/startify.vim'
endif

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
      \   'right': [[ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'fileformat', 'fileencoding', 'filetype' ],
      \             [ 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?" " . fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat'
      \ }
      \ }


let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \ }

let g:lightline.separator = {
	    \   'left': '', 'right': ''
      \ }
let g:lightline.subseparator = {
	    \   'left': '', 'right': '' 
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:promptline_symbols = {
    \ 'left'       : '',
    \ 'right'      : '',
    \ 'left_alt'   : '>',
    \ 'dir_sep'    : ' | ',
    \ 'truncation' : '...',
    \ 'space'      : ' '}

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

if has("gui_macvim")
    " set macvim specific stuff
  set macligatures
  set gfn=FuraCodeNerdFontComplete-Light:h13
endif

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
endif
