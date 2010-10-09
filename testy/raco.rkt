#lang racket

(require raco/command-name
         "runner.rkt")

(define tests-path
  (command-line
    #:program (short-program+command-name)
    #:args (tests-path)
    tests-path))

(main tests-path)

