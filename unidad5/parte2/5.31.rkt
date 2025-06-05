;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.31|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 31

; and2 : Any Any -> Boolean
; dado dos datos any devuelve #t si ambos son #t
(define (and2 x y)
  (and (boolean? x) (boolean? y) x y))

; todos-true : listof Any -> Boolean
; Devuelve #t si todos los elementos de la lista es #t
(define (todos-true l)
  (foldr and2 #t l))

(check-expect(todos-true (list 5 #true "abc" #true "def"))#f)
(check-expect(todos-true (list 1 #true (circle 10 "solid" "red") -12 #false))#f)