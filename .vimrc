call plug#begin('~/.vim/plugged')
" let Vundle manage Vundle
Plug 'gmarik/Vundle.vim'
Plug 'mattn/emmet-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'othree/html5.vim'
" Plug 'L9'
" Plug 'othree/vim-autocomplpop'
" Plug 'Shougo/deoplete.nvim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'nono/vim-handlebars'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'terryma/vim-expand-region'
Plug 't9md/vim-smalls'
Plug 'easymotion/vim-easymotion' "快速選取
Plug 'junegunn/vim-easy-align'
Plug 'othree/yajs'
Plug 'mxw/vim-jsx'
"Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-css-color'
Plug 'valloric/youcompleteme'
Plug 'joshdick/onedark.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'myusuf3/numbers.vim'
Plug 'sheerun/vim-polyglot'
" Add plugins to &runtimepath

call plug#end()
set t_Co=256
set bs=2
" vim auto indent
set cindent
set history=50
set modeline
set modelines=2
set nowrap
set number
set title
set wildmenu
set hlsearch
set incsearch
" Replace tab with 4 spaces.
set expandtab
set shiftwidth=2
set softtabstop=2

" Set cursor line.
set cursorline
set cursorcolumn

" vim mouse control ...you..know...
set mouse=a
" Auto-complete using Ctrl+K.
" set dictionary-=~/.vim/funclist.txt
" set complete-=k complete+=k

" Always use utf-8 encoding.
set fileencoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
"set encoding=utf-8
set tenc=utf-8

" cliboard config
set cb=unnamed,unnamedplus


"" keypad
"" http://vim.wikia.com/wiki/PuTTY_numeric_keypad_mappings
imap <Esc>Oq 1
imap <Esc>Or 2
imap <Esc>Os 3
imap <Esc>Ot 4
imap <Esc>Ou 5
imap <Esc>Ov 6
imap <Esc>Ow 7
imap <Esc>Ox 8
imap <Esc>Oy 9
imap <Esc>Op 0
imap <Esc>On .
imap <Esc>OQ /
imap <Esc>OR *
imap <Esc>Ol +
imap <Esc>OS -

" Set F1-F12 shortcut keys.
" NERDTree
nnoremap <silent> <F2> :NERDTreeMirrorToggle<CR>
let NERDTreeShowBookmarks  = 0
let g:nerdtree_tabs_focus_on_files = 1

let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
"let g:AirlineTheme='wombat'

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusli

" Activate scss.vim
au BufRead,BufNewFile *.scss set filetype=scss
" Removing tailing spaces.
au! BufWrite * mark ' | silent! %s/\s\+$// | norm ''
" Replace tab to spaces.
au BufWrite * :retab
" Set auto commands.
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif
" Make vim setting works immediately.
autocmd! BufWritePost .vimrc source %
" Output CSS files once *.scss saves.
" autocmd BufWritePost *.scss !compass_lite <afile> <afile>:r.css

" Create a template file.
" autocmd BufNewFile *.html so ~/.vim/html.txt
" autocmd BufNewFile *.html exe "1," . 10 . "g/name=\"created\" content=\".*\"/s//name=\"created\" content=\"" .strftime("%Y-%m-%d"). "\""
" autocmd Bufwritepre,filewritepre *.c execute "normal ma"
" autocmd BufWritePre,FileWritePre *.html exe "1," . 10 . "g/name=\"modified\" content=\".*\"/s//name=\"modified\" content=\"" .strftime("%c"). "\""
" autocmd bufwritepost,filewritepost *.c execute "normal `a"

" Special File Types
au BufRead,BufNewFile *.less set ft=less
au BufRead,BufNewFile *.tpl set ft=html
au BufRead,BufNewFile *.xsl set ft=html
au BufRead,BufNewFile *.json set syntax=json
au BufRead,BufNewFile *.hbs set syntax=handlebars
au BufRead,BufNewFile *.n3  set ft=n3
au BufRead,BufNewFile /usr/local/etc/nginx/* set ft=nginx
au BufRead,BufNewFile /etc/nginx/* set ft=nginx
au BufNewFile,BufRead *.gradle setf groovy
" au BufRead,BufNewFile *.coffee set ft=coffee

" scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" tab to indent
nmap <tab> V>
vmap <tab> >gv
nmap <s-tab> V<
vmap <s-tab> <gv

set autochdir
"auto mkdir -p when write to file
" ref: http://stackoverflow.com/questions/547719/is-there-a-way-to-make-mv-create-the-directory-to-be-moved-to-if-it-doesnt-exis
function! WriteCreatingDirs()
    execute ':silent !mkdir -p %:h'
    write
endfunction
command! W call WriteCreatingDirs()

" Autocomplpop: {{{
"" acp options
" let g:acp_enableAtStartup = 1
" " let g:acp_mappingDriven = 1
" let g:acp_completeOption = '.,w,b,u,t,i,k'
" " let g:acp_behaviorSnipmateLength = 0
"
" let g:acp_behaviorUserDefinedMeets = 'acp#meetsForKeyword'
" let g:acp_behaviorUserDefinedFunction = 'syntaxcomplete#Complete'
" }}}

"function! Empty(findstart, complWord)
"  return 0
"endfunction"
"autocmd FileType javascript set omnifunc=Empty


" Syntastic: {{{
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_javascript_jslint_conf = "--nomen --plusplus --forin --regexp"
"let g:syntastic_coffee_coffeelint_args = "--csv -f ~/.coffeelint-config.json"
" }}}

nmap <F3>  :set nopaste!<CR>

map <C-h> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"let g:ycm_semantic_triggers =  {
"  \   'coffee': ['.'],
"  \ }

"http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" let mapleader = "\<Space>"
"Type <Space>o to open a new file:
nnoremap <Leader>o :CtrlP<CR>
"Type <Space>w to save file (lot faster than :w<Enter>):
nnoremap <Leader>w :w<CR>

"Copy & paste to system clipboard with <Space>p and <Space>y:
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader><Leader> V

"III. Use region expanding
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)


" map normal-mode 's' for simple search
map s <Plug>(smalls)
" if you want to use smalls in visual/operator or both mode.
omap s <Plug>(smalls)
xmap s <Plug>(smalls)

let g:EasyMotion_leader_key = ','


" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
vmap <Leader> k(EasyAlign)


"CtrlSF https://github.com/dyng/ctrlsf.vim
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

let g:jsx_ext_required = 0
let g:ackprg = 'ag --nogroup --nocolor --column'


" git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
" ctrlp: {{{
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = ''
let g:ctrlp_use_caching = 0
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,cacahe,*.min.*,node_modules     " MacOSX/Linux
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|cache'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
 let g:ctrlp_custom_ignore = {
 \ 'dir':  'node_modules$\|\.git$\|\.meteor$\|\.svn$\|dist$\|\.hg$',
 \ 'file': '\.DS_Store$\|\.jpg$\|\.png$\|\.jpeg$\|\.gif$\|\.svg$'
 \ }

" ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"" set theme
syntax enable
syntax on

set background=dark
" Note: All options should be set before the colorscheme onedark line in your ~/.vimrc.
let g:onedark_terminal_italics = 1
colorscheme onedark


