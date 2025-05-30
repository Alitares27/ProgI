;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.15|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 15

; max : Listof Numbers -> Numbers
; Dada una lista de numeros devuelve
; el numero mayor de la lista

(define (maximo l)
  (cond [(empty? l) empty]
        [else (foldr max 0 l)]))

  (maximo (list 23 543 325 0 75))