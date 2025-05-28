;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.18|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Ej. 18

; raices : Listof Numbers -> Listof Numbers
; dada una lista de numeros, devuelve la raiz
; de dichos numeros
(define (raices l)
  (cond
    [(empty? l) '()]
    [else (cons (sqrt (first l))(raices(rest l)))]))

(raices (list 9 16 4))