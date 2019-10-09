" Disable vi compatibility (emulation of old bugs)
set nocompatible

" turn filetype detection off and, even if it's not strictly
" necessary, disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off

set rtp+=~/.vim/bundle/vundle.git/
call vundle#rc()
Plugin 'nerdtree'  
Plugin 'YouCompleteMe'
Plugin 'Colorizer'                                  " Show bash colors 
Plugin 'vim-cpp-enhanced-highlight'
Plugin 'vim-tmux-navigator'

Plugin 'vim-colors-solarized'
Plugin 'vim-airline'
Plugin 'vim-airline-themes'
Plugin 'vim-monokai'
Plugin 'gruvbox'
Plugin 'tender'

" Turn on filetype detection, indent scripts and filetype plugins on
" Need not to do filetype on as the below is superfluous
filetype plugin indent on

" Nerd Tree shortcut
let NERDTreeShowHidden=1                            " Always show hidden files
map <C-n> :NERDTreeToggle<CR>                       " Ctrl-N for toggle
map <C-c> :NERDTreeFocus<CR>                        " Ctrl-C for focus

" YouCompleteMe settings
" Build with ./install.sh --clang-completer
let g:ycm_complete_in_comments=1                    " turn on completion in comments 
let g:ycm_collect_identifiers_from_tags_files=1     " turn on tag completion
let g:ycm_seed_identifiers_with_syntax=1            " complete syntax keywords
let g:ycm_show_diagnostics_ui = 0                   " disable syntax check
" Enable to remove error on loading YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" vim-cpp-enhanced-highlight settings
let g:cpp_class_scope_highlight = 1                 " Highlighting of class scope
let g:cpp_member_variable_highlight = 1             " Highlighting of member variables
let g:cpp_class_decl_highlight = 1                  " Highlighting of class names in declarations
let g:cpp_experimental_template_highlight = 1       " Highlight template functions.

" Terminal settings 
set t_Co=256

" solarized settings 
let g:solarized_bold = 0
let g:solarized_contrast = "low"
let g:solarized_termcolors = 256

" Airline settings 
let g:airline_left_alt_sep = '>'
let g:airline_right_alt_sep = '<'

" Essential settings 
set nu                                              " enable line numbers
set autoindent                                      " use indentation of previous line
set smartindent                                     " use intelligent indentation for C
set tabstop=4                                       " tab width is 4 spaces
set shiftwidth=4                                    " indent also with 4 spaces
set expandtab                                       " expand tabs to spaces
set showmatch                                       " highlight matching braces
set hlsearch
" set cursorline

if (has("termguicolors"))
"    set t_8f=[38;2;%lu;%lu;%lum
"    set t_8b=[48;2;%lu;%lu;%lum
"    set termguicolors
endif

" Reset behaviour of ctrl + arrow keys
execute "set <xUp>=\e[1;*A"                         
execute "set <xDown>=\e[1;*B"
execute "set <xRight>=\e[1;*C"
execute "set <xLeft>=\e[1;*D"

" ctags settings
nnoremap <C-]> g<C-]>

set backupdir=~/.vim/backup/                        " In case you delete something accidently
set directory=~/.vim/swp/                           " Get rid of swap files too

set encoding=utf-8                                  " The encoding displayed.
set fileencoding=utf-8                              " The encoding written to file.

syntax on
set background=dark
colorscheme gruvbox
"colorscheme tender
"colorscheme monokai
"colorscheme koehler                                 " Hack to make monokai better
"colorscheme monokai
"colorscheme desert
"colorscheme solarized


" Diff mode works better with light backgroud
if &diff
    colorscheme gruvbox
    "set background=light
end
