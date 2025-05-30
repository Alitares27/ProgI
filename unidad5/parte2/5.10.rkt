;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |5.10|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Ej. 10

; cuadrados : Listof Numbers -> Listof Number
; dad una lista de numeros devuelve otra lista
; con los cuadrados de cada numero de la lista
(define (cuadrados l)
  (if (empty? l)
      empty
      (map sqr l)))

  (cuadrados (list 1 2 3))