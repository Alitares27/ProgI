;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.6|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 6

; raices : Listof Numbers -> Listof Numbers
; dada una lista de numeros devuelve una
; lista con las raices de cada numero
(define (raices l)
  (cond
    [(empty? l) empty]
    [else (map sqrt l)]))

(raices (list 9 16 4))