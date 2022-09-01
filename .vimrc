set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'tabnine/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'psf/black'
Plugin 'sheerun/vim-polyglot'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'cjuniet/clang-format.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'XML-Folding'
Plugin 'sansyrox/vim-python-virtualenv'

Plugin 'puremourning/vimspector'
Plugin 'vim-scripts/TaskList.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" shortcuts for splitting
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:SimpylFold_docstring_preview=1

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=84
set expandtab
set autoindent
set fileformat=unix

set encoding=utf-8

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Syntastic options
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"

let g:vimspector_enable_mappings = 'HUMAN'



let python_highlight_all=1
syntax on

autocmd BufNewFile,BufRead *.wrkcl set syntax=json

"allows mouse to be used
set nu
set list
set mouse=a


autocmd InsertLeave *.py Black
autocmd InsertLeave *.cpp,*.hpp ClangFormat
autocmd InsertLeave *.rs RustFmt

" Function for JSON only
function! EscapeBackslashes()
    %s/\\/\\\\/g
    %s/\\\\\\\\/\\\\/g
endfunction
command! EscapeBackslashes call EscapeBackslashes()
