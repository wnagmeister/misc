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
"Plug 'preservim/nerdtree'			"file browser
Plug 'psliwka/vim-smoothie' 			"smooth scroll
"Plug 'yuttie/comfortable-motion.vim'
Plug 'morhetz/gruvbox'				"colour scheme
"Plug 'vim-airline/vim-airline'			"status line, integration with git
Plug 'wikitopian/hardmode'			"toggles no arrow keys no hjkl
Plug 'valloric/youcompleteme'			"finally got it working autocomplete
						"and error checker but not necceeary
Plug 'tpope/vim-vinegar'
Plug 'dense-analysis/ale'			"linter, idk if works with ycm, feels slow
"Plug 'glench/vim-jinja2-syntax'			"jinja2 template syntax and stuff
"Plug 'mattn/emmet-vim'				"for html
Plug 'mcchrish/nnn.vim'				"nnn in vim
"Plug 'vifm/vifm.vim'
"Plug 'francoiscabrol/ranger.vim'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'

call plug#end()

"PLUGIN CONFIG

"AIRLINE CONFIG
let g:airline#extensions#tabline#enabled = 1	"buffer bar at top for airline
let g:airline_extensions= ["tabline"]

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

"	'autoflake' - Fix flake issues with autoflake.
"	'autoimport' - Fix import issues with autoimport.
"	'autopep8' - Fix PEP8 issues with autopep8.
"	'black' - Fix PEP8 issues with black.
"	'isort' - Sort Python imports with isort.
"	'pycln' - remove unused python import statements
"	'pyflyby' - Tidy Python imports with pyflyby.
"	'remove_trailing_lines' - Remove all blank lines at the end of a file.
"	'reorder-python-imports' - Sort Python imports with reorder-python-imports.
"	'ruff' - A python linter/fixer for Python written in Rust
"	'ruff_format' - Fix python files with the ruff formatter.	-like black
"	'trim_whitespace' - Remove all trailing whitespace characters at the end of every line.
"	'yapf' - Fix Python files with yapf.

"	'astyle' - Fix C/C++ with astyle.
"	'clang-format' - Fix C, C++, C#, CUDA, Java, JavaScript, JSON, ObjectiveC and Protobuf files with clang-format.
"	'clangtidy' - Fix C/C++ and ObjectiveC files with clang-tidy.
"	'remove_trailing_lines' - Remove all blank lines at the end of a file.
"	'trim_whitespace' - Remove all trailing whitespace characters at the end of every line.
"	'uncrustify' - Fix C, C++, C#, ObjectiveC, ObjectiveC++, D, Java, Pawn, and VALA files with uncrustify.


"let g:ale_c_flawfinder_minlevel = 3

:nnoremap \x :ALEFix<CR>

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
