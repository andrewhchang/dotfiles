" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Navigation/Search
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'dpretet/vim-leader-mapper'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'PhilRunninger/nerdtree-buffer-ops'

" ctrl p fuzzy search files that aren't git-ignored
nmap <C-P> :GFiles<CR>

" Appearance
Plugin 'prettier/vim-prettier'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'joshdick/onedark.vim'
Plugin 'bluz71/vim-nightfly-guicolors'

" Code Help
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'styled-components/vim-styled-components'
Plugin 'tpope/vim-fugitive'
Plugin 'farmergreg/vim-lastplace'
Plugin 'tomtom/tcomment_vim'

" Typescript/JS
Plugin 'leafgarland/typescript-vim'
Plugin 'quramy/tsuquyomi'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'jparise/vim-graphql'

" Lines
Plugin 'edkolev/tmuxline.vim'
Plugin 'itchyny/lightline.vim'

    " CoC & plugins
Plugin 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plugin 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plugin 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plugin 'neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile' }
Plugin 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting
Plugin 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' }
Plugin 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
Plugin 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plugin 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plugin 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}

call vundle#end()

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
colorscheme onedark
imap jj <Esc>
map <C-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" CoC actions
nmap <leader>qf    <Plug>(coc-fix-current)
" gc = git commit
nmap <leader>gc    :CocCommand git.showCommit<Enter>
" gr = git revert (chunk)
nmap <leader>gr    :CocCommand git.chunkUndo<Enter>
" gd = git diff (chunk)
nmap <leader>gd    :CocCommand git.chunkInfo<Enter>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>fd :CocCommand prettier.forceFormatDocument<Enter>

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"""""" disable annoying lowercase shortcut in visual-mode
vnoremap u <Nop>

        """"""""""""""""""""" COLORSCHEME """"""""""""""""""""

        " Normal         xxx ctermfg=145 ctermbg=235 guifg=#ABB2BF guibg=#282C34
        highlight Normal guibg=#202328
        highlight MatchParen guifg=#C678DD guibg=#504066
        highlight LineNr    guifg=#CAE1ED
        highlight CursorLineNr guifg=#56B6C2
        highlight Error guifg=#f57373 guibg=#804040
        highlight vimError guifg=#f57373 guibg=#804040

        hi IndentGuidesEven guibg=#2a2e30 guifg=#24282a
        hi IndentGuidesOdd guibg=#262a2c guifg=#24282a
        hi Comment cterm=italic guifg=#4a5158
        hi String guifg=#98C379 guibg=#2a2e34

        """ browns
        " function params: numbers and constants
        " hi Keyword guifg=#907161
        " hi Statement guifg=#56B6C2
        " hi Conditional guifg=#56B6C2

        " Yellows
        hi Number guifg=#E5C07B
        hi Special guifg=#E5C07B
        hi Boolean guifg=#E5C07B
        hi Type guifg=#F0A15F
        " #D19A66

        " purple
        hi CtrlPMatch guifg=#ba9ef7
        hi Visual guibg=#364652
        hi Keyword guifg=#ba9ef7
        hi Function guifg=#5682A3

        " dark grey, RUST preproc
        hi Preproc guifg=#37505C

        """ Pink
        """""" vim-jsx ONLY
        hi Identifier guifg=#D96Ab2
        " hi Identifier cterm=italic guifg=#D96Ab2
        " hi Statement guifg=#D96AB2
        hi Conditional guifg=#D96AB2

        """ Go and Python
        " Light blue
        autocmd FileType python,go highlight Keyword guifg=#59ACE5
        autocmd FileType python,go highlight goDeclaration guifg=#59ACE5
        " Dark blue
        autocmd FileType python,go highlight Function guifg=#2974a1
        autocmd FileType python,go highlight goConditional guifg=#2974a1
        " cyan
        autocmd FileType python,go highlight goStatement guifg=#56B6C2
        autocmd FileType python,go highlight goRepeat guifg=#56B6C2


        " " dark red
        " hi tsxTagName guifg=#E06C75
        " " orange
        " hi tsxCloseString guifg=#F99575
        " hi tsxCloseTag guifg=#F99575
        " hi tsxAttributeBraces guifg=#F99575
        " hi tsxEqual guifg=#F99575
        " " yellow
        " hi tsxAttrib guifg=#F8BD7F cterm=italic

        " light blue
        hi tsxTagName guifg=#59ACE5
        hi tsxComponentName guifg=#59ACE5
        " dark blue
        hi tsxCloseString guifg=#2974a1
        hi tsxCloseTag guifg=#2974a1
        hi tsxAttributeBraces guifg=#2974a1
        hi tsxEqual guifg=#2974a1
        hi tsxCloseTagName guifg=#2974a1
        hi tsxCloseComponentName guifg=#2974a1
        " green
        hi tsxAttrib guifg=#1BD1C1


        " cyan
        hi Constant guifg=#56B6C2
        hi typescriptBraces guifg=#56B6C2
        hi typescriptEndColons guifg=#56B6C2
        hi typescriptRef guifg=#56B6C2
        hi typescriptPropietaryMethods guifg=#56B6C2
        hi typescriptEventListenerMethods guifg=#56B6C2
        hi typescriptFunction guifg=#56B6C2
        hi typescriptVars guifg=#56B6C2
        hi typescriptParen guifg=#56B6C2
        hi typescriptDotNotation guifg=#56B6C2
        hi typescriptBracket guifg=#56B6C2
        hi typescriptBlock guifg=#56B6C2
        hi typescriptJFunctions guifg=#56B6C2
        hi typescriptSFunctions guifg=#56B6C2
        hi typescriptInterpolationDelimiter guifg=#56B6C2
        hi typescriptExceptions guifg=#DDA671
        " hi typescriptIdentifier guifg=#907161
        " hi typescriptStorageClass guifg=#907161
        hi typescriptIdentifier guifg=#65809D
        hi typescriptStorageClass guifg=#65809D
        " JSON
        hi jsonCommentError cterm=italic guifg=#4a5158

        " javascript
        hi jsParens guifg=#56B6C2
        hi jsObjectBraces guifg=#C678DD
        hi jsFuncBraces guifg=#56B6C2
        hi jsObjectFuncName guifg=#D19A66
        hi jsObjectKey guifg=#56B6C2

        " vim-jsx-typescript
        hi ReactState guifg=#C176A7
        hi ReactProps guifg=#D19A66
        hi ApolloGraphQL guifg=#CB886B
        hi Events ctermfg=204 guifg=#56B6C2
        hi ReduxKeywords ctermfg=204 guifg=#C678DD
        hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
        hi WebBrowser ctermfg=204 guifg=#56B6C2
        hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66


        " JSX Dark Blue and Neon Green highlights
        hi xmlEndTag guifg=#2974a1
        " hi tsxCloseString guifg=#2974a1
        hi tsxCloseString guifg=#15608f
        hi htmlTag guifg=#2974a1
        hi htmlEndTag guifg=#2974a1
        hi htmlTagName guifg=#59ACE5
        hi tsxAttrib guifg=#1BD1C1

        hi tsxTypeBraces guifg=#BDA7CC
        hi tsxTypes guifg=#8D779C
        hi tsxIfOperator guifg=#56B6C2
        hi tsxElseOperator guifg=#56B6C2


        " rust cyan
        hi rustModPath guifg=#DF997A
        hi rustFuncCall guifg=#60A0D0
        hi rustFuncName guifg=#60A0D0
        hi rustTrait guifg=#C898C8
        hi rustCommentLine guifg=#aaaaaa guifg=#444444


        hi rustFoldBraces guifg=#FFEAD0
        hi rustBoxPlacementBalance guifg=#C898C8

        hi ALEError      guibg=#612E2D cterm=italic
        hi ALEWarning    guibg=#523D30 cterm=italic
        " Coc linting colors
        hi CocErrorHighlight   guibg=#612E2D cterm=italic
        hi CocWarningHighlight guibg=#523D30 cterm=italic
        hi CocHighlightText    guibg=#40334A

        hi CocInfoHighlight    guibg=#A5BFD5 cterm=italic
        hi CocHintHighlight    guibg=#A5BFD5 cterm=italic

        hi CocErrorSign   guifg=#CD584F
        hi CocWarningSign guifg=#D3785D


"""""""" Vim lightline  """""""""""
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'mode_map': { 'c': 'NORMAL' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ], [ 'filename' ] ],
    \   'right': [[ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype']],
    \ },
    \ 'component_function': {
    \   'modified': 'LightlineModified',
    \   'readonly': 'LightlineReadonly',
    \   'filename': 'LightlineFilename',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \   'fileencoding': 'LightlineFileencoding',
    \   'mode': 'LightlineMode',
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
    \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '♤ ' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != expand('%f') ? expand('%f') : '[New File]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

" NORMAL / INSERT / VISUAL
function! LightlineMode()
  return winwidth(0) > 40 ? lightline#mode() : ''
endfunction

" javascript.jsx
function! LightlineFiletype()
  return winwidth(0) > 100 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

" utf-8
function! LightlineFileencoding()
  return winwidth(0) > 80 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

" unix
function! LightlineFileformat()
  return winwidth(0) > 120 ? &fileformat : ''
endfunction

let g:lightline.enable = {
\   'tabline': 1
\ }

"""""""""""" end lightline """""""""""""""

" React Syntax
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" Fix window size
autocmd VimEnter * set winfixwidth

" For plug-ins to load correctly.
filetype plugin indent on

" Automatically wrap text that extends beyond the screen length.
set wrap
" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

set matchpairs+=<:>

" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

 set guifont=Roboto\ Mono\ Nerd\ Font\ Bold:h18
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid


" Enable 256 colors palette in Gnome Terminal
" if $COLORTERM == 'gnome-terminal'
"     set t_Co=256
" endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" turn hybrid line numbers on
set number relativenumber
set nu rnu

set scrolloff=10    " Keep 10 lines (top/bottom) for scope
set mouse=a         " Scrollable term-vim
set splitright    " Preview window opens to the right, not above

" Autoindent, make tab=4 spaces, smart indenting
set expandtab
set shiftwidth=4
set autoindent
set smartindent

" Set swapfile directory
set directory=~/.vim/swap,.

