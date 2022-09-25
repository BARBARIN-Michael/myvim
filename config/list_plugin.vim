call plug#begin()

" ===================
" List plugins
" ===================

Plug 'dense-analysis/ale'
Plug 'https://github.com/tpope/vim-fugitive'

" To del if treesitter better
Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-commentary'

" Replace by Telescope
" Plugin 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'preservim/tagbar'

" Test whithout coc, i try to implemant lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plugin 'prabirshrestha/vim-lsp'

" Plugin 'Shougo/deoplete.nvim'
" Plugin 'lighttiger2505/deoplete-vim-lsp'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

Plug 'sakhnik/nvim-gdb'

" Plug for marks vim
Plug 'kshenoy/vim-signature'

" Plug fold access
Plug 'pseewald/vim-anyfold'


" ===================
" Setup plugins
" ===================
"

" ===================
" vim-lsp setup
" ===================
"if executable('ccls')
"    au User lsp_setup call lsp#register_server({
"                \ 'name': 'ccls',
"                \ 'cmd': {server_info->['ccls']},
"                \ 'root_uri': {server_info->lsp#utils#path_to_uri(
"                \   lsp#utils#find_nearest_parent_file_directory(
"                \     lsp#utils#get_buffer_path(), ['.ccls', 'compile_commands.json', '.git/']))},
"                \ 'initialization_options': {
"                    \   'highlight': { 'lsRanges' : v:true },
"                    \   'cache': {'directory': stdpath('cache') . '/ccls' },
"                    \ },
"                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
"                    \ })
"endif

" ===================
" ale setup
" ===================
let g:ale_linters = {'cpp': ['clang']}
let g:ale_cpp_cc_options = '-std=C++20 -Wall'
let g:ale_cpp_clangcheck_executable = 'clang-check'


" ===================
" NerdTree setup
" ===================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
map <C-r> :NERDTreeFind<cr> 


" ===================
" VimAirLine setup
" ===================
let g:airline#extensions#tabline#enabled = 1


" ===================
" Vim Rainbow {{}}
" ===================
au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active=1


" ===================
" COC options
" ===================
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

"inoremap <silent><expr> <Tab>
"            \ pumvisible() ? "\<C-n>" :
"            \ <SID>check_back_space() ? "\<Tab>" :
"            \ coc#refresh()
nnoremap gt <cmd>CocCommand clangd.switchSourceHeader<cr>
nnoremap gi <cmd>CocCommand clangd.symbolInfo<cr>

" ===================
" TagBar options
" ===================
nmap <F8> :TagbarToggle<CR>

"source coc.vim

" ===================
" Telescope options
" ===================
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>



" ===================
" Ultisnips options
" ===================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" ===================
" Fold options
" ===================
" filetype plugin indent on " required
syntax on                 " required

autocmd Filetype * AnyFoldActivate               " activate for all filetypes
" or
"autocmd Filetype <your-filetype> AnyFoldActivate " activate for a specific filetype

set foldlevel=0  " close all folds
" or
"set foldlevel=99 " Open all folds

" ===================
" end of plugins
" ===================
call plug#end()               " required
