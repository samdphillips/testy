#lang racket

(require (for-syntax syntax/parse)
         racket/block
         rackunit)

(define-for-syntax (guess-test-name)
  (let ([mod-name (current-module-declare-name)])
    (if mod-name
        (path->string
         (resolved-module-path-name mod-name))
        "<anonymous>")))

(define-syntax module-begin
  (syntax-parser
    #:literals (require)
    [(_ name:str
        (~or (require r ...) e) ...)
     #'(#%module-begin
         (require r ... ...)

         (define tests
           (test-suite name (block e ...)))

         (provide tests))]
    [(mb e ...)
     #:with name (datum->syntax #'mb (guess-test-name))
     #'(module-begin name e ...)]))

(provide (except-out (all-from-out racket)
                     #%module-begin)
         (all-from-out rackunit)
         (rename-out [module-begin #%module-begin]))
