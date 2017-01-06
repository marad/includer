#lang racket/base

(require racket/string
         racket/file
         racket/list
         racket/cmdline)

(define args (parse-command-line "includer" (current-command-line-arguments)
                                 `()
                                 (lambda (flag-accum in-file out-file) (list in-file out-file))
                                 '("file-to-process" "output-file")))

(define in-file (first args))
(define out-file (second args))

(define dir (simplify-path (build-path (string->path in-file) "..")))

(define input (open-input-file in-file #:mode 'text))

(define (read-file-name include-line)
  (string-trim (substring include-line 8)))

(define (process-line line)
  (if (string-prefix? line "#include")
    (string-trim (file->string (build-path dir (read-file-name line))))
    line))

(display-lines-to-file (for/list ([line (in-lines input)])
                         (process-line line))
                       out-file
                       #:mode 'text
                       #:exists 'replace)

