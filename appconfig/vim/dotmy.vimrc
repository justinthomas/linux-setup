" set path for filename suggestions
" ** means "in any subfolder"
set path+=~/git/**

" set colorscheme, but ifaoif we are in normal mode
if g:user_mode == "1"
  colorscheme jellybeans " JELLYBEANS COLOR_SCHEME ACTIVE
  " colorscheme raggi " LIGHT COLOR_SCHEME
endif

" where should vim look for the tags?
" tags are generated by ctags utility
" multiple paths should be separated by comma
set tags+=~/tags,~/tags-once

" VIMUX
" " compile stuff
" map <Leader>j :call VimuxRunCommand("cd ~/timepix_workspace; catkin build rospix")<CR>
" " close the vimmux window
" map <Leader>l :VimuxCloseRunner<CR>

" building ctags
command! MakeTags :call VimuxRunCommand("generateTags; :q")<CR>
"
"""""""""""""""""""""""""""""""

" customize bookmarks in startify
let g:startify_bookmarks = [
            \ { 'b': '~/.bashrc' },
            \ { 'v': '~/.vimrc' },
            \ { 'p': '~/git/linux-setup/appconfig/vim/startify_quotes.txt' },
            \ ]
