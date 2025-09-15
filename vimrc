"HELPFUL COMMANDS

":echo &option		tells you setting of option

"VANILLIA VIM OPTIONS

:set autoindent
:set number
:set rnu
:set hidden
:set hlsearch
:set scrolloff=10
:set tabstop=4
:set shiftwidth=4
:set cursorline

"VANILLA VIM KEYBINDS

let g:mapleader=" "
"I will use \ as the leader for plugin specific commands

:nnoremap <silent> <Esc> <Esc>:nohlsearch<CR><Esc>
:nnoremap <leader><Tab> :bn<CR>
:nnoremap <leader>b :bn<CR>
:nnoremap <leader><CR> o<Esc>
:nnoremap ; :

:command! E Ex
:command! L Lex

"PLUGINS

call plug#begin()

Plug 'jiangmiao/auto-pairs' 			"auto enclose parentheses and quotes
Plug 'psliwka/vim-smoothie' 			"smooth scroll
Plug 'morhetz/gruvbox'				"colour scheme
Plug 'wikitopian/hardmode'			"toggles no arrow keys no hjkl
Plug 'valloric/youcompleteme'			"finally got it working autocomplete
						"and error checker but not necceeary
Plug 'tpope/vim-vinegar'
Plug 'dense-analysis/ale'			"linter, idk if works with ycm, feels slow
"Plug 'glench/vim-jinja2-syntax'			"jinja2 template syntax and stuff
"Plug 'mattn/emmet-vim'				"for html
Plug 'mcchrish/nnn.vim'				"nnn in vim
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'			"comments out blocks
Plug 'ap/vim-css-color'				"background highlights hex colours

call plug#end()

"PLUGIN CONFIG

"LIGHTLINE CONFIG
:set laststatus=2
:let g:lightline = {"colorscheme":"gruvbox",}

"YOUCOMPLETEME CONFIG
:let g:ycm_confirm_extra_conf = 0
:let updatetime = 100
:let g:ycm_autoclose_preview_window_after_completion = 1
": let g:ycm_semantic_triggers = { 'c,python': ['re!(?=[a-zA-Z_])'],}

nnoremap \g  :YcmCompleter GoTo<CR>
nnoremap \r  :YcmCompleter GoToReferences<CR>
nnoremap \f  :YcmCompleter FixIt<CR>
nnoremap \d  :YcmCompleter GetDoc<CR>
nnoremap \t  :YcmCompleter GetType<CR>
nnoremap \n	 :YcmCompleter RefactorRename 

"NNN CONFIG
let g:nnn#action = {
      \ '<c-s>': 'split',
      \ '<c-V>': 'vsplit' }

"ALE CONFIG
let g:ale_python_pylint_options = "--disable=C0111"
"let g:ale_linters_ignore = {'c': ['cc']}
let g:ale_linters = {
\	"python": ["mypy", "pyright",  "pylint", "ruff", "flake8"],
\	'c': ['clangd'],
\	'cpp': ['clangd']}		"only enable linters needed to increase performance
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autoflake', "black"],
\	"c": ["clang-format", "uncrustify", "astyle"],
\}

:nnoremap \x :ALEFix<CR>

"CTRLP CONFIG
let g:ctrlp_show_hidden=1 

"COLOURSCHEME AND BACKGROUND CONFIGS
function! CSGruvbox ()
	:set background=dark
	:colorscheme gruvbox		"default is :hi Normal ctermbg=235
endfunction

function! CSGruvboxTrans ()
	:set background=dark
	:colorscheme gruvbox
	:hi Normal ctermbg=None
endfunction

function! CSDefault ()
	:set background=light
	:colorscheme default
	:hi Comment ctermfg=75
	:hi VISUAL ctermbg=DarkGrey
	:hi SEARCH ctermbg=DarkGrey
	:hi YcmErrorSection ctermbg=DarkRed
endfunction

function! CSDefaultDark ()
	:colorscheme default
	:set background=dark
endfunction

:command! Gb call CSGruvbox()
:command! Gbt call CSGruvboxTrans()
:command! Df call CSDefault()
:command! Dfd call CSDefaultDark()

:call CSGruvboxTrans()
