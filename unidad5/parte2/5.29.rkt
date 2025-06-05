;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.29|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 29

; positivo : Number -> Boolean
; dado un numero devuelve #t si es mayor a cero
(define (positivo l)
  (> l 0))

; algun-pos : Lisof List -> Boolean
; dada una lista de listas devuelve #t si la suma de alguna lista es positiva
(define (algun-pos l)
  (cond
    [(empty? l) #f]
    [(positivo (foldr + 0 (first l)))#t]
    [else (algun-pos (rest l))]))

(check-expect(algun-pos (list (list 1 3 -4 -2) (list 1 2 3 -5) (list 4 -9 -7 8 -3)))#t)
(check-expect(algun-pos (list empty (list 1 2 3)))#t)
(check-expect(algun-pos (list (list -1 2 -3 4 -5) empty (list -3 -4)))#f)

