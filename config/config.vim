colorscheme gruvbox

set number
nnoremap <silent> <Leader>p :call <SID>ToggleCopyPasteMode()<CR>

function! s:ToggleCopyPasteMode()
	if &list
		set nolist
		set paste
		set nonumber
		set norelativenumber
		set foldcolumn=0
		if exists(":NumbersDisable")
			:NumbersDisable
		endif
		set mouse=
	else
		set list
		set nopaste
		set number
		set relativenumber
		set foldcolumn=1
		if exists(":NumbersEnable")
			:NumbersEnable
		endif
		set mouse=a
	endif
endfunction


autocmd VimEnter * call <SID>CreateKeybindings()

function! s:CreateKeybindings()
	if exists(":CtrlP")
		nnoremap <Leader>o :CtrlP<CR>
	endif
endfunction

map <S-L> :bn<CR>
map <S-H> :bp<CR>
map <S-K> :buffers<CR>
map <S-J> :Bclose<CR>


nmap <C-L> :tabnext<CR>
nmap <C-H> :tabprevious<CR>
nmap <C-K> :tabnew<CR>
nmap <C-J> :tabclose<CR>


" ===================
" vim option
" ===================
set tabstop=4
set shiftwidth=4
set expandtab

