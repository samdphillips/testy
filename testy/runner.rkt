#lang racket

(require rackunit
         rackunit/text-ui)

(define (string-prefix? s1 s2)
  (for/and ([c1 (in-string s1)]
            [c2 (in-string s2)])
    (char=? c1 c2)))

(define (string-suffix? s1 s2)
  (define rev
    (compose list->string
             reverse
             string->list))

  (string-prefix? (rev s1) (rev s2)))


(define (find-tests path)
  (for/fold ([p null]) ([f (directory-list path)])
    (let ([f (path->string f)])
      (if (and (string-prefix? "test-" f)
               (string-suffix? ".rkt"  f))
          (cons (path->string (build-path path f)) p)
          p))))

(define (load-tests paths)
  (define tests
    (for/list ([mod paths])
      (dynamic-require mod 'tests)))

  (make-test-suite "Tests" tests))

(define (main tests-path)
  (let* ([tests (find-tests tests-path)]
         [suite (load-tests tests)])
    (run-tests suite)
    (void)))

(provide main)
