" gs in normal mode speaks the current line asychronously
nmap gs :.!tee >(espeak) &<CR>

" Speaks a line asynchronously after each enter in insert mode
imap <CR> <ESC>:.!tee >(espeak -s 110) &<CR>o
