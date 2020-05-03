" Disable vi compatibility (emulation of old bugs)
set nocompatible

" turn filetype detection off and, even if it's not strictly
" necessary, disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'nerdtree'
" Nerd Tree shortcut
let NERDTreeShowHidden=1                            " Always show hidden files
map <C-n> :NERDTreeToggle<CR>                       " Ctrl-N for toggle

Plugin 'YouCompleteMe'
" YouCompleteMe settings
" Build with ./install.sh --clang-completer
let g:ycm_complete_in_comments=1                    " turn on completion in comments
let g:ycm_collect_identifiers_from_tags_files=1     " turn on tag completion
let g:ycm_seed_identifiers_with_syntax=1            " complete syntax keywords
let g:ycm_show_diagnostics_ui = 0                   " disable syntax check
" Enable to remove error on loading YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" YCM will auto-close the preview window after the user leaves insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1

Plugin 'Colorizer'                                  " Show bash colors
Plugin 'vim-cpp-enhanced-highlight'
" vim-cpp-enhanced-highlight settings
let g:cpp_class_scope_highlight = 1                 " Highlighting of class scope
let g:cpp_member_variable_highlight = 1             " Highlighting of member variables
let g:cpp_class_decl_highlight = 1                  " Highlighting of class names in declarations
let g:cpp_experimental_template_highlight = 1       " Highlight template functions.

Plugin 'vim-tmux-navigator'
Plugin 'tagbar'
Plugin 'nerdtree-tagbar-combined.git'
map <C-c> :ToggleNERDTreeAndTagbar<CR>              " Ctrl-C for focus

Plugin 'vim-surround'
Plugin 'vim-better-whitespace'
" whitespace setting 'StripWhitespace' to remove all whitespaces
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

Plugin 'fzf'
Plugin 'fzf.vim'
" FZF setting to behave at ctrlp
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :Files<cr>

Plugin 'vim-colors-solarized'
" solarized settings
let g:solarized_bold = 0
let g:solarized_contrast = "low"
let g:solarized_termcolors = 256

Plugin 'vim-airline'
Plugin 'vim-airline-themes'
" Airline settings
let g:airline_powerline_fonts = 1
let g:airline_left_alt_sep = '>'
let g:airline_right_alt_sep = '<'
let g:airline#extensions#tabline#enabled = 1

Plugin 'vim-monokai'
Plugin 'gruvbox'
Plugin 'tender'

" Turn on filetype detection, indent scripts and filetype plugins on
" Need not to do filetype on as the below is superfluous
filetype plugin indent on

" Essential settings
set nu                                              " enable line numbers
set softtabstop=2
set shiftwidth=2
set expandtab

set autoindent                                      " use indentation of previous line
set smartindent                                     " use intelligent indentation for C
set tabstop=4                                       " tab width is 4 spaces
set expandtab                                       " expand tabs to spaces
set showmatch                                       " highlight matching braces
set hlsearch
set encoding=utf-8
set cursorline
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:↲,extends:⟩,precedes:⟨
"set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,
set nolist
set colorcolumn=80

" Use tab to shift to next buffer and SHIFT-tab to previous buffer
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

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
