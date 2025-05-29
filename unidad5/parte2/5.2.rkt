;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.2|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 2

; pares : Listof Numbers -> Listof Number
; Dada una lista de numeros devuelve los
; numeros pares de dicha lista
(define (pares l)
  (cond
    [(empty? l) empty]
    [else ( filter even? l)]))

(pares (list 4 6 3 7 5 0)) 