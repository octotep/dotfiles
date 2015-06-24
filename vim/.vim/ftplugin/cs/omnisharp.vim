" This file contains Omnisharp settings
" Most of this file is copied straight from the default example on github

" Fetch full documentation during omnicomplete requests. There is a performance
" penalty with this (especially on Mono). By default, only Type/Method
" signatures are fetched. Full documentation can still be fetched when you need
" it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

" Use unite.vim
let g:OmniSharp_selector_ui = 'unite'

" Set the type lookup function to use the preview window instead of the status
" line
let g:OmniSharp_typeLookupInPreview = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

" Showmatch significantly slows down omnicomplete when the first match contains
" parentheses.
set noshowmatch

" Move the preview window (code documentation) to the bottom of the screen, so
" it doesn't move the code!  " You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

" If you are using the omnisharp-roslyn backend, use the following
" let g:syntastic_cs_checkers = ['code_checker']

augroup omnisharp_commands
    autocmd!

    " Set autocomplete function to OmniSharp (if not using YouCompleteMe
    " completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    " autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " Builds can also run asynchronously with vim-dispatch installed
    autocmd FileType cs nnoremap <leader>ob :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    " autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    " show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the current cursor position.
    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>ofi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>oft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>ofs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>ofu :OmniSharpFindUsages<cr>
    " finds members in the current buffer
    autocmd FileType cs nnoremap <leader>ofm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>ox  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>ofx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>ott :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>odc :OmniSharpDocumentation<cr>
    " navigate up by method/property/field
    autocmd FileType cs nnoremap <leader>k :OmniSharpNavigateUp<cr>
    " navigate down by method/property/field
    autocmd FileType cs nnoremap <leader>j :OmniSharpNavigateDown<cr>

    " Contextual code actions (requires CtrlP or unite.vim)
    " nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
    " Run code actions with text selected in visual mode to extract method
    " vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

    " rename with dialog
    autocmd FileType cs nnoremap <leader>or :OmniSharpRename<cr>
    " rename without dialog - with cursor on the symbol to rename... ':Rename newname'
    autocmd FileType cs command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

    " Force OmniSharp to reload the solution. Useful when switching branches etc.
    autocmd FileType cs nnoremap <leader>orl :OmniSharpReloadSolution<cr>
    autocmd FileType cs nnoremap <leader>ocf :OmniSharpCodeFormat<cr>
    " Load the current .cs file to the nearest project
    autocmd FileType cs nnoremap <leader>otp :OmniSharpAddToProject<cr>

    " (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp
    " server for the current solution
    autocmd FileType cs nnoremap <leader>oss :OmniSharpStartServer<cr>
    autocmd FileType cs nnoremap <leader>osp :OmniSharpStopServer<cr>

    " Add syntax highlighting for types and interfaces
    autocmd FileType cs nnoremap <leader>oth :OmniSharpHighlightTypes<cr>

    " this setting controls how long to wait (in ms) before fetching type
    " / symbol information.
    autocmd FileType cs set updatetime=300
    " Remove 'Press Enter to continue' message when type information is longer
    " than one line.
    autocmd FileType cs set cmdheight=2
    " Don't ask to save when changing buffers (i.e. when jumping to a type
    " definition)
    autocmd FileType cs set hidden
augroup END
