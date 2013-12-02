set shiftwidth=4	" odsazovani o 4
set tabstop=4		" tabulator ma sirku 4
set expandtab		" mezery misto tabu
set showmatch		" pri psani to ukazuje parove zavorky
set tenc=utf-8		" kodovani terminalu
set fenc=utf-8		" kodovani souboru
set enc=utf-8		" ViM kodovani
set showcmd
set mouse=c
set list lcs=tab\:\'\ ,trail:~

" pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" solarized
set t_Co=256
"let g:solarized_termcolors = 256
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
hi SpellBad ctermbg=53 cterm=bold

" Current line/col highlight
set cul
set nu

" gundo
map <leader>g :GundoToggle<CR>

" git
map <leader>c :Gwrite -av<CR>
map <leader>b :Gblame<CR>
map <leader>d :Gdiff<CR>

" python tab completion
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
"
" status line  
set laststatus=2
set statusline=%(%m\ %)%f%(\ %y%)%(\ [%{&fileencoding}]%)%=%{fugitive#statusline()}%=[%3b,%4(0x%B%)]\ %3c\ %4l\ /%5L\ %4P

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"Command-T
set wildignore+=*.o,*.obj,.git,*.pyc,*.pyo,*.gif,*.png,*.jpg
let g:CommandTMaxFiles=20000
let g:CommandTAcceptSelectionTabMap=['<CR>']
let g:CommandTAcceptSelectionMap=['\']

" klavesy
noremap <F10> :set paste!<CR>
noremap <silent> <F11> :set nohlsearch<CR>
noremap <silent> <F12> :set nu!<CR>
noremap <C-T> :tabnew<CR>
noremap <F1> :tabnext 1<CR>
noremap <F2> :tabnext 2<CR>
noremap <F3> :tabnext 3<CR>
noremap <F4> :tabnext 4<CR>
noremap <F5> :tabnext 5<CR>
noremap <F6> :tabnext 6<CR>
noremap <F7> :tabnext 7<CR>
noremap <F8> :tabnext 8<CR>
noremap <F9> :tabnext 9<CR>


" find as you type
set incsearch
" ask on q! etc
set confirm
" backup
set backup
set backupdir=~/.backup
set directory=~/tmp,.,/tmp
" Tab menu for ex
set wildchar=<Tab>
set wildmenu
set wildmode=longest:full,full
