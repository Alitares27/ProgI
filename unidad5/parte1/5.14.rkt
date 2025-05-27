;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.14|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 14

(define (mayores l n)
  (cond
    [(empty? l) '()]
    [(> (first l) n)(cons (first l)(mayores (rest l)n))]
    [else (mayores (rest l) n)]))


(mayores '(5 1 8 6 7 9) 7)