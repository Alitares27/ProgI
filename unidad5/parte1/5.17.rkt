;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.17|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 17

(define (eliminar l n)
  (cond
    [(empty? l) '()]
    [(=(first l) n)(eliminar (rest l)n)]
    [else (cons (first l)(eliminar (rest l) n))]))

(eliminar (list 1 2 3 2 7 6) 0)