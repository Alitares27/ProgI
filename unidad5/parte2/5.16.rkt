;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.16|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 16

; verificar : Boolean Boolean -> Boolean
; dado dos booleanos devuelve un booleano
(define (and2 x y)
  (and x y))


; todos-verdaderos : Listof Booleans -> Boolean
; dada una lista de booleanos, devuelve un booleano
; si todos son booleanos
(define (todos-verdaderos l)
  (if(empty? l) #t
     (foldr and2 #t l)))

(todos-verdaderos (list #t #f #t))

(todos-verdaderos (list #t #t #t #t))