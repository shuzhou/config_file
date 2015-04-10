map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set completeopt=menu,menuone  
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MayCompleteScope=1
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1  
let OmniCpp_DefaultNamespace=["std"]  
let OmniCpp_ShowPrototypeInAbbr=1
let OmniCpp_SelectFirstItem = 2
set nu
set tabstop=4
set shiftwidth=4
syntax on 
"colorscheme wombat
colorscheme desert
set hlsearch
set incsearch
set smartindent
set autoindent
set cursorline
set showmatch  
set ruler
set textwidth=1000
set cindent
set nobackup

filetype on

nmap <F4> :NERDTreeToggle<cr>
nmap <F2> :TlistToggle<cr>
nmap <F12> :Calendar<cr>


nmap <C-k> <C-W>k
nmap <C-j> <C-W>j
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=0
let Tlist_Exist_OnlyWindow = 1 
let Tlist_Sort_Type = "name"
let Tlist_Compart_Format = 1
let g:winManagerWindowLayout='FileExplorer|TagList'

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 

" C/C++
map <F5> :call CompileRunGcc5()<CR>
func! CompileRunGcc5()
	exec "!make clean"
	exec "w"
	exec "!make"
	endfunc

" C/C++
map <F7> :call CompileRunGcc7()<CR>
func! CompileRunGcc7()
	exec "w"
	exec "!make"
	endfunc

" Encoding settings
if has("multi_byte")
	" Set fileencoding priority
	if getfsize(expand("%")) > 0
		set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
	else
		set fileencodings=cp936,big5,euc-jp,euc-kr,latin1
	endif

	" CJK environment detection and corresponding setting
	if v:lang =~ "^zh_CN"
		" Use cp936 to support GBK, euc-cn == gb2312
		set encoding=cp936
		set termencoding=cp936
		set fileencoding=cp936
	elseif v:lang =~ "^zh_TW"
		" cp950, big5 or euc-tw
		" Are they equal to each other?
		set encoding=big5
		set termencoding=big5
		set fileencoding=big5
	elseif v:lang =~ "^ko"
		" Copied from someone's dotfile, untested
		set encoding=euc-kr
		set termencoding=euc-kr
		set fileencoding=euc-kr
	elseif v:lang =~ "^ja_JP"
		" Copied from someone's dotfile, unteste
		set encoding=euc-jp
		set termencoding=euc-jp
		set fileencoding=euc-jp
	endif
	
	" Detect UTF-8 locale, and replace CJK setting if needed
	if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
		set encoding=utf-8
		set termencoding=utf-8
		set fileencoding=utf-8
	endif
endif
"插件管理神器vundle
set nocompatible " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
 
" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
"vim文件查找利器
"FuzzyFinder-Ctrl+Shift+R
"map<C-S-R>:FufFileRecursive<CR>
Bundle 'FuzzyFinder'

" non github repos
"##################NERDTree使用方法###########################
"1. 在命令行界面，输入vim.2.输入：NERDTree,3.回车.4.多次摁crtl+w切换
Bundle 'The-NERD-tree'
"##################NERDCommenter使用方法######################
"
Bundle 'The-NERD-Commenter'
" ...
Bundle 'Rip-Rip/clang_complete'

filetype plugin indent on     " required!
"
" Brief help  -- 此处后面都是vundle的使用命令
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
