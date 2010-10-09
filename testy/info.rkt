#lang setup/infotab

(define name "Testy")
(define blurb
  (list '(div "A simple test harness tool")))

(define categories
  '(devtools))

(define primary-file "main.rkt")
(define version "1.0")

(define repositories '("4.x"))
(define required-core-version "5.0")

(define release-notes
  (list '(div "Initial release")))

(define raco-commands
  (list '("testy"
          (planet "raco.rkt" ("samdphillips" "testy.plt" 1))
          "A simple test harness tool"
          10)))


