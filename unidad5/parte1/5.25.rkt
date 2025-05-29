;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.25|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 25

; prod : Listof Numbers -> Listof Numbers
; Dada una lista de numeros devuelve como
; resultado la multiplicacion de dichos numeros
(define (prod l)
  (cond
    [(empty? l) empty]
    [else  (foldr * 1 l)]))

(prod (list 1 2 3 4 5))
