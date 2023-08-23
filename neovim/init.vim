set hidden

filetype indent plugin on

set colorcolumn=89

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

set noshowmode
set signcolumn=yes
set cmdheight=1
set updatetime=300
set ruler
set number
set visualbell

set nobackup
set nowritebackup
set noswapfile

set shortmess+=c

au BufRead *.py silent
  set foldmethod=indent

nnoremap <space> za
nnoremap <F9> :Black<CR>
tnoremap <Esc> <C-\><C-n>

let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-pyright', 'coc-yaml', 'coc-python']
let g:coc_disable_startup_warning = 1
" COC tab completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" ALE
let g:ale_python_auto_pipenv = 1
let g:ale_sign_column_always = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let b:ale_linters = ['flake8', 'mypy', 'isort', 'shellcheck']
let g:ale_fixers = {}
let g:ale_fixers.python = ['black']

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psf/black'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'pearofducks/ansible-vim'
Plug 'github/copilot.vim'
Plug 'sindrets/diffview.nvim'
call plug#end()

syntax on
colorscheme dracula
let g:lightline = {
            \'colorscheme': 'darcula',
            \ }

highlight Normal ctermbg=none
highlight NonText ctermbg=none
