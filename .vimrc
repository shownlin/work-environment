set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
colorscheme molokai

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nanotech/jellybeans.vim'
Plugin 'yegappan/taglist'
Plugin 'preservim/nerdtree'
Plugin 'wenlongche/SrcExpl'
Plugin 'wenlongche/Trinity'
Plugin 'majutsushi/tagbar'
Plugin 'yegappan/mru'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/highlight.vim'
Plugin 'jmcantrell/vim-diffchanges'

" All of your Plugins must be added before the following line
call vundle#end()            " required
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

let g:molokai_original = 1
set laststatus=2  "永遠顯示狀態列
let g:airline_powerline_fonts = 1 "支援 powerline 字型
let g:airline#extensions#tabline#enabled = 1 "顯示視窗tab和buffer
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

" for ctags
set tags=./tags,./TAGS,tags;~,TAGS;~

"for cscope
if has("cscope")
  set cscopetag
  set csto=0
  if filereadable("cscope.out")
    cs add cscope.out
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  else
    let cscope_file=findfile("cscope.out", ".;")
    let cscope_pre=matchstr(cscope_file, ".*/")
    if !empty(cscope_file) && filereadable(cscope_file)
      exe "cs add" cscope_file cscope_pre
    endif
  endif
  set cscopeverbose

  nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

"for MRU
nmap <F7> :MRU<CR>

"for TagList
"nmap <F8> :TlistToggle<CR>
nmap <F8> :TrinityToggleTagList<CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
set ut=100

"for NerdTree
function! MyNERDTree()
	if exists("g:NERDTree") && g:NERDTree.IsOpen()
		:NERDTreeToggle
	else
		:NERDTreeFind
	endif
endfunction
nmap <F9> :call MyNERDTree()<CR>
"nmap <F9> :TrinityToggleNERDTree<CR>
let NERDTreeWinPos="right"
let NERDTreeMapOpenInTab='<ENTER>'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"for SrcExpl
"nmap <F10> :SrcExplToggle<CR>
nmap <F10> :TrinityToggleSourceExplorer<CR>
let g:SrcExpl_isUpdateTags = 0
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_",
        \ "Source_Explorer"
    \ ]

"for Trinity
nmap <F12> :TrinityToggleAll<CR>

"for built-in function
nnoremap <A-Left> :tabprevious<CR>
nnoremap <A-Right> :tabnext<CR>
