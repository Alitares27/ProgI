;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.16|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 16

; positivos : Listof Number -> Listof number
; dada una lista de numeros devuelve una lista
; de numeros positivos
(define (positivos l)
  (cond
    [(empty? l) '()]
    [(> (first l) 0)(cons (first l)(positivos (rest l)))]
    [else (positivos (rest l))]))

(positivos (list -5 37 -23 0 12))