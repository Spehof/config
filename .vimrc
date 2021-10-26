set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Fzf plugin for vim
" https://github.com/junegunn/fzf.vim
"Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim' 
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }


" Plugin 'ierton/xkb-switch'
" https://github.com/lyokha/vim-xkbswitch
Plugin 'lyokha/vim-xkbswitch'

" https://vimawesome.com/plugin/vim-airline-superman
" https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'


" All of your Plugins must be added before the following line
call vundle#end()            " required


" Airline config ------------------------------------------------------------
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
let g:Powerline_symbols = 'unicode'

let g:airline_powerline_fonts=1
let g:gruvbox_contrast_dark="meduim"

if !exists('g:airline_symbols')
    let g:airline_symbols = {} 
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" Airline end config --------------------------------------------------

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line




" Настройки табов для Python, согласно рекоммендациям
set tabstop=4 
set shiftwidth=4
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе
" Автоотступ
set autoindent
" Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1
" Включаем 256 цветов в терминале, мы ведь работаем из иксов?
" Нужно во многих терминалах, например в gnome-terminal
set t_Co=256

" Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

syntax on "Включить подсветку синтаксиса

set nu "Включаем нумерацию строк
set mousehide "Спрятать курсор мыши когда набираем текст
set mouse=a "Включить поддержку мыши
set termencoding=utf-8 "Кодировка терминала
set novisualbell "Не мигать 
set t_vb= "Не пищать! (Опции 'не портить текст', к сожалению, нету)
" Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]
" Вырубаем черточки на табах
set showtabline=1

" Вставка текста из системных буферов " и * через макросы на стандартные
" клавиши
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
"let @+=@"

" Настройки поиска
set ignorecase " Поиск без учета регистра
set smartcase 
set hlsearch " Подсвечивать результаты поиска

" Переносим на другую строчку, разрываем строки
set wrap
set linebreak

" Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251

set clipboard=unnamedplus
set ruler

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" unset finding highlits
nnoremap <C-L> :noh<CR>

" Выключаем звук в Vim
set visualbell t_vb=

"Переключение табов по CMD+number для MacVim
if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

" ---- Automatic keyboard layout switching upon entering/leaving insert mode
" ---- using xkb-switch utility and plugin xkbswitch
" ----
let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']
let g:XkbSwitchNLayout = 'us'
let g:XkbSwitchILayout = 'us'
" loading xkbswitch on BufRead when bufhidden=delete will clash xkbswitch
" function imappings_load() and plugin EnhancedJumps as soon as both will do
" redir simultaneously!
let g:XkbSwitchLoadOnBufRead = 0
let g:XkbSwitchSkipIMappings =
            \ {'c'   : ['.', '>', ':', '{<CR>', '/*', '/*<CR>'],
            \  'cpp' : ['.', '>', ':', '{<CR>', '/*', '/*<CR>']}
let g:XkbSwitchSkipFt = [ 'conque_term' ]
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines
let g:XkbSwitchDynamicKeymap = 1
let g:XkbSwitchKeymapNames = {'ru' : 'russian-jcukenwin'}


" Prefer font and colorscheme
set guifont=Monaco:h18
colorscheme OceanicNext

"Светлые:

"Adam
" colorscheme editplus
" colorscheme LightTan
" colorscheme PapayaWhip
" colorscheme PaperColor
" colorscheme Tomorrow
" colorscheme emacs
" colorscheme fokus
" colorscheme garden
" colorscheme bclear
" colorscheme cleanroom
" colorscheme eclipse
" colorscheme fine_blue
" colorscheme fruidle
" colorscheme fruit
" colorscheme google
" colorscheme grape
" colorscheme guepardo
" colorscheme lazarus
" colorscheme leya
" colorscheme loogica
" colorscheme louver
" colorscheme macvim-light
" colorscheme martin_krischik
" colorscheme mod_tcsoft
" colorscheme neutron
" colorscheme rakr-light
" colorscheme softlight
" colorscheme stonewashed-256
" colorscheme vylight
" colorscheme wikipedia
" colorscheme zenesque

" Тёмные:

" colorscheme archery
" colorscheme Atelier_CaveLight
" colorscheme PerfectDark
" colorscheme SerialExperimentsLain
" colorscheme fairyfloss
" colorscheme flatcolor
" colorscheme flattened_dark
" colorscheme Atelier_SavannaDark
" colorscheme blueprint
" colorscheme darkglass
" colorscheme doriath
" colorscheme getfresh
