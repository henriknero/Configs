set autoindent
set tabstop=4
syntax enable
set cursorline
set wildmenu
set incsearch
colorscheme morning
set relativenumber
filetype plugin on
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
