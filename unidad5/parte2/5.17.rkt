;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.17|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 17

; largo : Listof Any -> Number
; dada una lista de cualquier elemento
; devuelve la cantidad de elementos
; en la lista
(define (largo  l)
  (cond [(empty? l) empty]
        [else (length l)]))

(check-expect(largo (list 1 "hola" #t -5))4)