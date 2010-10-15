#lang racket

(require (for-syntax syntax/parse)
         rackunit/gui)

(define-syntax module-begin
  (syntax-parser
    [(mb mods ...)
     #:with (rtests ...) (generate-temporaries #'(mods ...))
     
     #'(#%module-begin
         (require (rename-in mods [tests rtests]) ...)

         (test/gui rtests ...))]))

(provide (except-out (all-from-out racket) #%module-begin)
         (all-from-out rackunit/gui)
         (rename-out [module-begin #%module-begin]))
