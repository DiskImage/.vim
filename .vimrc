so ~/.vim/supertab.vim

"Turn on code completion ftw.
set completeopt=menu,longest,preview


if bufwinnr(1)
  map + <C-w>+
  map - <C-w>-
endif


"Quick-quit
map qq <Esc>:qa!<CR>
"Break line at cursor
map K i<Enter><Esc>



" switch to insert with jj
 imap jj <Esc>

 " disable arrow keys
    map <up> <nop>
    map <down> <nop>
    map <left> <nop>
    map <right> <nop>
    imap <up> <nop>
    imap <down> <nop>
    imap <left> <nop>
    imap <right> <nop>


"silent
"colorscheme charon


set number
set list!
set listchars=tab:._
highlight  Comment ctermfg=yellow
"set nocompatible    " use vim defaults
set expandtab       " ex
set ls=2            " allways show status line
set tabstop=4       " numbers of spaces of tab character
set softtabstop=4
set shiftwidth=4    " numbers of spaces to autoindent
"set scrolloff=3     " keep 3 lines when scrolling
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set ruler           " show the cursor position all the time
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell
set nobackup        " do not keep a backup file
set number          " show line numbers
set ignorecase      " ignore case when searching
"set noignorecase   " don't ignore case
set title           " show title in console title bar 
set ttyfast         " smoother changes
set modeline        " last lines in document sets vim mode
set modelines=3     " number lines checked for modelines
set shortmess=atI   " Abbreviate messages
set nostartofline   " don't jump to first character when paging

"set autoindent     " always set autoindenting on
"set smartindent        " smart indent
"set cindent            " cindent
"set noautoindent

"set nosmartindent
"set nocindent  

"let &t_ti.="\e[?30l"
"let &t_te.="\e[?30h"


filetype plugin on

set foldmethod=indent
set foldnestmax=10
set nofoldenable
" set foldlevel=1 

"set autowrite      " auto saves changes when quitting and swiching buffer
"set expandtab      " tabs are converted to spaces, use only when required
"set sm             " show matching braces, somewhat annoying...
"set nowrap         " don't wrap lines

syntax on           " syntax highlighing
hi Folded ctermfg=0
hi Comment    gui=NONE guifg=#e3d1e3

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
     " Filetypes (au = autocmd)
    au FileType helpfile set nonumber      " no line numbers when viewing help
    au FileType helpfile nnoremap <buffer><cr> <c-]>   " Enter selects subject
    au FileType helpfile nnoremap <buffer><bs> <c-T>   " Backspace to go back
     
     au FileType cpp,c,java,sh,pl,php,asp  set autoindent
     au FileType cpp,c,java,sh,pl,php,asp  set smartindent
     au FileType cpp,c,java,sh,pl,php,asp  set cindent
       
     " File formats
     au BufNewFile,BufRead  *.pls    set syntax=dosini
     au BufNewFile,BufRead  modprobe.conf    set syntax=modconf
endif

call pathogen#infect()

if has("mouse")
    set mouse=a
endif

" NERDTree specific configuration
    "NERDTree Startup/Shutdown configuration
        " Open a NERDTree automatically when vim starts up if no files were specified
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

        "Close vim if the only window left open is a NERDTree
"        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


    " Change default NERDTree options
        let g:NERDTreeShowHidden=1

    "Makes Ctrl+N keyboard shortcut to toggle NERDTree open/closed
        map <C-n> :NERDTreeToggle<CR>
