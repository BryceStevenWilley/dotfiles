" Sets hybrid numbers: current line says absolute line number
" and all other lines have the relative line number.
set number relativenumber

" Turns tabs into spaces.
set expandtab
set shiftwidth=2
"set softtabstop=0 
set tabstop=4


" speeds up scroll time sigfinicantly.
set lazyredraw

" Starts the new line at the last indentation level.
set autoindent

" Tell vim to remember things when we exit.
" '10 : marks will be remembered for up to 10 previously edited file.
" "100 : 100 lines per register
" :20 : 20 lines of command history
" % saves and restores the buffer list.
" n...: where to save viminfo.
set viminfo='10,\"100,:20,%,n~/.viminfo

" Shows trailing whitespace.
let c_space_errors = 1
let java_space_errors = 1
let python_space_errors = 1

" Saves last position in a file.
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" In Makefiles, do *not* turn tabs into spaces.
autocmd FileType make setlocal noexpandtab

" Turns on spellcheck for Latex files.
autocmd FileType latex setlocal spell spelllang=en_us


" Stops you from navigating using up-down-left-right in normal mode.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
