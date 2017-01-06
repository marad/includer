set makeprg=./build.sh

nmap <c-x> :!racket src/includer.rkt data/to_filter data/filtered && cat data/filtered<cr>
